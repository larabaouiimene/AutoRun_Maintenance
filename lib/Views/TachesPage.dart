import 'dart:convert';
import 'package:autorun/utils/globals.dart' as globals;
import 'package:autorun/Modeles/anomalie.dart';
import 'package:autorun/Modeles/tache.dart';
import 'package:autorun/Views/PannePage.dart';
import 'package:autorun/assets/Menu.dart';
import 'package:autorun/assets/MyIcons.dart';
import 'package:autorun/assets/NewIcon.dart';
import 'package:autorun/assets/Next.dart';
import 'package:autorun/widgets/TachesList.dart';
import 'package:http/http.dart' as http;

import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:flutter/material.dart';

const color = Color(0xFF4361EE);

class MesTaches extends StatefulWidget {
  @override
  _MesTachesState createState() => new _MesTachesState();
}

class _MesTachesState extends State<MesTaches> {
  @override
  late Future<String> _value;
  Widget build(BuildContext context) {
    GetTache(context);
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
                          margin: EdgeInsets.only(left: 50, right: 20, top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Vos taches",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'Nunito',
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(height: 500, child: myApiWidget()
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

  Future<List<Tache>> GetTache(BuildContext context) async {
    var response = await http.get(
      Uri.parse('https://autorun-crud.herokuapp.com/tache'),
    );
    var jsonData = json.decode(response.body);
    List<Tache> taches = [];
    for (var u in jsonData) {
      Tache tache = Tache(
          anomalie: u["anomalie"],
          dateIntervention: u["dateIntervention"],
          idEtape: u["idEtape"]);
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
    print(taches.length);
    return taches;
  }

  Future<List<dynamic>> fetchAnomalies() async {
    var result = await http
        .get(Uri.parse("https://autorun-crud.herokuapp.com/anomalie"));
    print(result.body);
    return jsonDecode(result.body);
  }

  Future<http.Response> Test() async {
    return await http.get(
        Uri.parse('https://autorun-crud.herokuapp.com/anomalie'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
  }

  Future<String> getValue() async {
    await Future.delayed(Duration(seconds: 3));

    return 'Woolha';
  }

  myApiWidget() {
    return FutureBuilder(
        future: GetTache(context),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          print(snapshot.data);

          if (snapshot.data == null) {
            return Container(
              child: Center(
                child: Text("loading..."),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: TacheListWidget(
                      vehicule: "Lamborghini Urus",
                      temps: snapshot.data[index].idEtape,
                      localisation: "Oued Smar.Alger"),
                );
              },
            );
          }
        });
  }
}
