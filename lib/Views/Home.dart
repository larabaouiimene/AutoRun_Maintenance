import 'dart:convert';

import 'package:autorun/Views/TachesPage.dart';
import 'package:autorun/assets/Menu.dart';
import 'package:autorun/assets/MyIcons.dart';
import 'package:autorun/assets/Next.dart';
import 'package:autorun/assets/SlideBar.dart';
import 'package:autorun/widgets/TacheWidget.dart';
import 'package:autorun/widgets/VehiculeWidget.dart';
import 'package:flutter/material.dart';
import 'package:autorun/utils/globals.dart' as globals;
import 'package:http/http.dart' as http;
import '../Modeles/anomalie.dart';
import '../Modeles/tache.dart';
import '../Modeles/vehicule.dart';
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
                        Container(height: 200, child: myApiWidget()),
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
                                  onPressed: () {},
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
                        Container(
                            height: 140,
                            child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: <Widget>[
                                  SizedBox(
                                    width: 30,
                                  ),
                                  VehiculeWidget(
                                    vehicule: "Lamborghini Urus",
                                    image: "assets/imgs/car.png",
                                    couleur: Colors.yellow,
                                  ),
                                  VehiculeWidget(
                                    vehicule: "Lamborghini Urus",
                                    image: "assets/imgs/car.png",
                                    couleur: Colors.lightBlue,
                                  ),
                                  VehiculeWidget(
                                    vehicule: "Lamborghini Urus",
                                    image: "assets/imgs/car.png",
                                    couleur: Colors.yellow,
                                  )
                                ]))
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
    print(response.body);
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
            statusAnomalie: u["anomalie"]["statusAnomalie"],
            temperatureVehicule:
                u["anomalie"]["temperatureVehicule"].toString(),
            vehicule: Vehicule(
                idVehicule: u["anomalie"]["vehicule"]["idVehicule"],
                marque: u["anomalie"]["vehicule"]["marque"])),
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
    print('helloooooooooooooo');
    print(taches.length);
    print(response.body);
    return taches;
  }

  myApiWidget() {
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
            return Expanded(
                child: ListView.builder(
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
}
