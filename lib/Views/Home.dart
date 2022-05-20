import 'dart:convert';

import 'package:autorun/Modeles/MyVehicule.dart';
import 'package:autorun/Modeles/typeVehicule.dart';
import 'package:autorun/Views/TachesPage.dart';
import 'package:autorun/Views/Vehicule.dart';
import 'package:autorun/Views/VehiculesPage.dart';
import 'package:autorun/assets/MyIcons.dart';
import 'package:autorun/assets/SlideBar.dart';
import 'package:autorun/widgets/VehiculeWidget.dart';
import 'package:flutter/material.dart';
import 'package:autorun/utils/globals.dart' as globals;
import 'package:http/http.dart' as http;
import '../Modeles/anomalie.dart';
import '../Modeles/tache.dart';
import '../widgets/TachesList.dart';

class Home extends StatelessWidget {
  static const color = Color(0XFF4361EE);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            margin: EdgeInsets.only(top: 27),
            color: color,
            child: Column(children: [
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.only(left: 35, right: 35, top: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(SlideBar.groupe_104),
                          Icon(
                            MyIcons.bell,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 8),
                        child: Column(
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  //Image.asset("assets/imgs/bonjour.png"),
                                  Text(
                                    "Bonjour 👋",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.bold),
                                  )
                                ]),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "${globals.user.nom} " +
                                      "${globals.user.prenom}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Nunito',
                                      fontSize: 25,
                                      color: Colors.white),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                      /* Row(
                  
                      children: [
                        Image.asset("assets/imgs/bonjour.png"),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "\n ABIR BENZAAMIA",
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        )
                      ],
                    )*/
                    ],
                  ),
                ),
              ),
              Expanded(
                  flex: 3,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black38,
                            spreadRadius: 0,
                            blurRadius: 10),
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Mes tâches",
                                style: TextStyle(
                                    color: color,
                                    fontSize: 22,
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.bold),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MesTaches()));
                                  },
                                  child: const Text(
                                    "Voir tous",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                        fontFamily: 'Nunito'),
                                  ))
                            ],
                          ),
                        ),
                        Container(height: 200, child: myApiWidgetTache()),
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Mes véhicules",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Nunito',
                                    color: color,
                                    fontSize: 22),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MesVehicules()));
                                  },
                                  child: const Text(
                                    "Voir tous",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                        fontFamily: 'Nunito'),
                                  ))
                            ],
                          ),
                        ),
                        myApiWidgetVehicule(),
                      ],
                    ),
                  ))
            ])));
  }

  Future<List<Tache>> GetTache() async {
    var id_AM = globals.user.id;
    ;
    var response = await http.get(
      Uri.parse(
          "https://autorun-crud.herokuapp.com/tache?&filter=anomalie.vehicule.amVehicule||\$eq||${id_AM}"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    var jsonData = json.decode(response.body);
    List<Tache> taches = [];
    for (var u in jsonData) {
      Tache tache = Tache(
        idTache: u["idTache"],
        dateIntervention: u["dateIntervention"],
        anomalie: Anomalie(
            dataDeclenchement: u["anomalie"]["dataDeclenchement"],
            dateFin: u["anomalie"]["dateFin"],
            idAnomalie: u["anomalie"]["idAnomalie"],
            lalitudePositionVehicule:
                u["anomalie"]["latitudePositionVehicule"].toDouble(),
            logitudePositionVehicule:
                u["anomalie"]["logitudePositionVehicule"].toDouble(),
            niveauChargeVehicule:
                u["anomalie"]["niveauChargeVehicule"].toString(),
            statutAnomalie: u["anomalie"]["statutAnomalie"],
            temperatureVehicule:
                u["anomalie"]["temperatureVehicule"].toString(),
            vehicule: MyVehicule(
              idVehicule: u["anomalie"]["vehicule"]["idVehicule"],
              marque: u["anomalie"]["vehicule"]["marque"],
              amVehicule: u["anomalie"]["vehicule"]["amVehicule"],
              couleur: u["anomalie"]["vehicule"]["couleur"],
              matricule: u["anomalie"]["vehicule"]["matricule"],
              modele: u["anomalie"]["vehicule"]["modele"],
              verrouillee: u["anomalie"]["vehicule"]["verrouillee"],
              enService: u["anomalie"]["vehicule"]["enService"],
            )),
      );
      /* Anomalie anomalie = Anomalie(
          idAnomalie: u["idAnomalie"],
          logitudePositionVehicule: u["logitudePositionVehicule"],
          lalitudePositionVehicule: u["lalitudePositionVehicule"],
          niveauChargeVehicule: u["niveauChargeVehicule"],
          statusAnomalie: u["statusAnomalie"],
          temperatureVehicule: u["temperatureVehicule"],
          dateFin: u["dateFin"],
          dataDeclenchement: u["dataDeclenchement"]);*/
      taches.add(tache);
    }
    /*  print('helloooooooooooooo');
    print(taches.length);
    print(response.body);*/
    return taches;
  }

  myApiWidgetTache() {
    return FutureBuilder(
        future: GetTache(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          print(snapshot.data);

          if (snapshot.data == null) {
            return Container(
              child: Center(
                child: Text("loading..."),
              ),
            );
          } else {
            return Container(
                child: ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: TacheListWidget(
                    vehicule: snapshot.data[index].anomalie.vehicule.marque,
                    temps: snapshot.data[index].anomalie.dataDeclenchement,
                    localisation: "Oued Smar.Alger",
                    tache: snapshot.data[index],
                  ),
                );
              },
            ));
          }
        });
  }

  Future<List<MyVehicule>> GetVehicules() async {
    var id_AM = globals.user.id;
    ;
    var response = await http.get(
      Uri.parse("https://autorun-crud.herokuapp.com/vehicule"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print(response.body);
    print(response.statusCode);
    var jsonData = json.decode(response.body);
    List<MyVehicule> vehicules = [];
    for (var u in jsonData) {
      MyVehicule vehicule = MyVehicule(
        idVehicule: u["idVehicule"],
        marque: u["marque"],
        amVehicule: u["amVehicule"],
        couleur: u["couleur"],
        matricule: u["matricule"],
        modele: u["modele"],
        verrouillee: u["verrouillee"],
        enService: u["enService"],
      );

      /* Anomalie anomalie = Anomalie(
          idAnomalie: u["idAnomalie"],
          logitudePositionVehicule: u["logitudePositionVehicule"],
          lalitudePositionVehicule: u["lalitudePositionVehicule"],
          niveauChargeVehicule: u["niveauChargeVehicule"],
          statusAnomalie: u["statusAnomalie"],
          temperatureVehicule: u["temperatureVehicule"],
          dateFin: u["dateFin"],
          dataDeclenchement: u["dataDeclenchement"]);*/
      vehicules.add(vehicule);
    }
    print('helloooooooooooooo');
    print(vehicules.length);
    print(response.body);
    return vehicules;
  }

  myApiWidgetVehicule() {
    return FutureBuilder(
        future: GetVehicules(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          print(snapshot.data);

          if (snapshot.data == null) {
            return Container(
              child: Center(
                child: Text("loading..."),
              ),
            );
          } else {
            return Container(
                height: 140,
                width: 400,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: VehiculeWidget(
                        vehicule: snapshot.data[index].marque,
                        image: "assets/imgs/car.png",
                        couleur: Colors.yellow,
                      ),
                    );
                  },
                ));
          }
        });
  }
}
