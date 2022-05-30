import 'dart:convert';
import 'package:autorun/Modeles/MyVehicule.dart';
import 'package:autorun/utils/globals.dart' as globals;
import 'package:autorun/Modeles/anomalie.dart';
import 'package:autorun/Modeles/tache.dart';

import 'package:autorun/assets/NewIcon.dart';
import 'package:autorun/widgets/TachesList.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import '../Modeles/typeVehicule.dart';

const color = Color(0xFF4361EE);

class MesTaches extends StatefulWidget {
  @override
  _MesTachesState createState() => new _MesTachesState();
}

class _MesTachesState extends State<MesTaches> {
  @override
  late Future<String> _value;
  Widget build(BuildContext context) {
    GetTache();
    return Scaffold(
        body: Container(
            margin: EdgeInsets.only(top: 27),
            color: Colors.white,
            child: Column(children: [
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.only(left: 35, right: 35, top: 40),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            NewIcon.angle_right,
                            color: color,
                            size: 20,
                          ),
                          Text(
                            "Mes taches",
                            style: TextStyle(
                                color: color,
                                fontSize: 22,
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),

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
                  flex: 6,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: color,
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
                          margin: EdgeInsets.only(left: 50, right: 20, top: 3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [],
                          ),
                        ),
                        Container(height: 500, child: myApiWidgetTache()
                            /*ListView(children: <Widget>[
                              SizedBox(
                                width: 30,
                              ),
                              TacheListWidget(
                                  vehicule: "Lamborghini Urus",
                                  temps: "il y a 3 minutes",
                                  localisation: "Oued Smar.Alger"),
                              TacheListWidget(
                                  vehicule: "Lamborghini Urus",
                                  temps: "il y a 3 minutes",
                                  localisation: "Oued Smar.Alger"),
                              TacheListWidget(
                                  vehicule: "Lamborghini Urus",
                                  temps: "il y a 3 minutes",
                                  localisation: "Oued Smar.Alger"),
                              TacheListWidget(
                                  vehicule: "Lamborghini Urus",
                                  temps: "il y a 3 minutes",
                                  localisation: "Oued Smar.Alger")
                            ])*/
                            ),
                      ],
                    ),
                  ))
            ])));
  }

  Future<List<Tache>> GetTache() async {
    var id_AM = globals.user.id;
    ;

    //"https://autorun-crud.herokuapp.com/tache?&filter=anomalie.vehicule.am||\$eq||${id_AM}"
    var response = await http.get(
      Uri.parse(
          "https://autorun-crud.herokuapp.com/tache?&filter=anomalie.vehicule.am||\$eq||${id_AM}"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print(response.body);
    var jsonData = json.decode(response.body);
    List<Tache> taches = [];
    for (var u in jsonData) {
      print(u["idTache"]);
      Tache tache = Tache(
        idTache: u["idTache"],
        dateInterventionTache: u["dateInterventionTache"],
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
            ),
            causePanne: u["anomalie"]["causePanne"]),
        dateFinTache: u["dateFinTache"],
        descriptionTache: u["descriptionTache"],
        nomTache: u["nomTache"],
        tache_terminee: u["tache_terminee"],
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
            return Expanded(
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
}
