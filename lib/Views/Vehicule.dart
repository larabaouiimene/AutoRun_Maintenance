import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:autorun/assets/NewIcon.dart';
import 'package:autorun/assets/Next.dart';
import 'package:autorun/assets/PanneIcon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:autorun/utils/globals.dart' as globals;

class VehiculePage extends StatelessWidget {
  static const color = Color(0XFF4361EE);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.grey.withOpacity(0.8),
          margin: EdgeInsets.only(top: 27),
          child: Column(children: [
            Expanded(
                flex: 1,
                child: Container(
                    child: Row(children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      NewIcon.angle_right,
                      size: 25,
                      color: color.withOpacity(0.3),
                    ),
                  ),
                  Text(
                    "Mes Véhicules",
                    style: TextStyle(
                        color: color.withOpacity(0.3),
                        fontSize: 25,
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.bold),
                  ),
                ]))),
            Expanded(
                flex: 8,
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
                      Expanded(
                          flex: 1,
                          child: Container(
                            margin: EdgeInsets.only(left: 30, top: 30),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  topLeft: Radius.circular(20)),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text("${globals.myVehicule.marque}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Nunito',
                                            fontSize: 25,
                                            color: Colors.white)),
                                  ],
                                ),
                              ],
                            ),
                          )),
                      Expanded(
                        flex: 5,
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
                            child: Container(
                              margin: EdgeInsets.only(left: 30, right: 20),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      Text("Caractéristiques",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Nunito',
                                              fontSize: 18,
                                              color: Colors.black)),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                          height: 50,
                                          width: 70,
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.grey),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    " Marque",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15,
                                                        fontFamily: 'Nunito'),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "${globals.myVehicule.marque}",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        fontFamily: 'Nunito'),
                                                  )
                                                ],
                                              )
                                            ],
                                          )),
                                      Container(
                                          height: 50,
                                          width: 70,
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.grey),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    " Modèle",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15,
                                                        fontFamily: 'Nunito'),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "${globals.myVehicule.modele}",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        fontFamily: 'Nunito'),
                                                  )
                                                ],
                                              )
                                            ],
                                          )),
                                      Container(
                                          height: 50,
                                          width: 70,
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.grey),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    " Couleur",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15,
                                                        fontFamily: 'Nunito'),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "${globals.myVehicule.couleur}",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        fontFamily: 'Nunito'),
                                                  )
                                                ],
                                              )
                                            ],
                                          )),
                                      Container(
                                          height: 50,
                                          width: 70,
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.grey),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    " Type",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15,
                                                        fontFamily: 'Nunito'),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    " Sport",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        fontFamily: 'Nunito'),
                                                  )
                                                ],
                                              )
                                            ],
                                          )),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Container(
                                      margin: EdgeInsets.all(10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            " Matricule",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                                fontFamily: 'Nunito'),
                                          ),
                                          Text(
                                            "${globals.myVehicule.matricule}",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontFamily: 'Nunito'),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Localisation",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Nunito',
                                              fontSize: 18,
                                              color: Colors.black)),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Container(
                                        margin: EdgeInsets.all(10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Icon(
                                              PanneIcon.marker__1_,
                                              color: color,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                                "Av.Colonel Mellah Ali,Algiers 16000",
                                                style: TextStyle(
                                                    fontFamily: 'Nunito',
                                                    fontSize: 15,
                                                    color: Colors.black))
                                          ],
                                        ),
                                      )),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text("Statut",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Nunito',
                                                  fontSize: 18,
                                                  color: Colors.black)),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            PanneIcon.road,
                                            color: color,
                                            size: 15,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text("En service",
                                              style: TextStyle(
                                                  fontFamily: 'Nunito',
                                                  fontSize: 15,
                                                  color: Colors.black))
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            NewIcon.unlock,
                                            color: color,
                                            size: 15,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          if (globals.myVehicule.verrouillee)
                                            Text("Verrouillé",
                                                style: TextStyle(
                                                    fontFamily: 'Nunito',
                                                    fontSize: 15,
                                                    color: Colors.black))
                                          else
                                            Text("Verrouillé",
                                                style: TextStyle(
                                                    fontFamily: 'Nunito',
                                                    fontSize: 15,
                                                    color: Colors.black))
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Container(
                                    height: 50,
                                    width: 250,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: color),
                                    child: MaterialButton(
                                        onPressed: () {
                                          CreatPanne(context);
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      VehiculePage()));
                                        },
                                        child: const Text(
                                          "Signaler une panne",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontFamily: 'Nunito'),
                                        )),
                                  ),
                                ],
                              ),
                            )),
                      )
                    ],
                  ),
                ))
          ])),
    );
  }

  Future<void> CreatPanne(BuildContext context) async {
    var url = "https://autorun-crud.herokuapp.com/panne";
    var response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, Object>{
          "idAnomalie": "0",
          "anomalieTraitee": "true",
          "causePanne": "string",
          "logitudePositionVehicule": "0",
          "latitudePositionVehicule": "0",
          "niveauChargeVehicule": "0",
          "temperatureVehicule": "0",
          "statutAnomalie": "EN_COURS",
          "vehicule": {
            "idVehicule": "${globals.myVehicule.idVehicule}",
            "marque": "${globals.myVehicule.marque}",
            "matricule": "${globals.myVehicule.matricule}",
            "modele": "${globals.myVehicule.modele}",
            "couleur": "${globals.myVehicule.couleur}",
            "verrouillee": globals.myVehicule.verrouillee ? "true" : "false",
            "enService": globals.myVehicule.enService ? "true" : "false",
            "am": {"amId": "${globals.myVehicule.amVehicule}"},
            "typeVehicule": {
              "idTypeVehicule": "0",
              "valTypeVehicule": "string",
              "tarifHeure": "0"
            }
          }
        }));
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 201) {
      var jsonData = json.decode(response.body);
      var idAnomalie;
      for (var k in jsonData.keys) {
        var u = jsonData[k];
        if (k == "idAnomalie") {
          idAnomalie = u;
        }
        print(idAnomalie);
      }
      CreatTache(context, idAnomalie);
    } else {
      print(response.statusCode);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("une erreur s'est produit")));
    }
  }

  Future<void> CreatTache(BuildContext context, id) async {
    var url = "https://autorun-crud.herokuapp.com/tache";
    var response = await http.post(Uri.parse(url),
        headers: {"content-type": "application/json"},
        body: jsonEncode(<String, Object>{
          "idTache": 0,
          "dateInterventionTache": "2022-05-27T08:20:27.377Z",
          "dateFinTache": "2022-05-27T08:20:27.377Z",
          "tache_terminee": false,
          "nomTache": "string",
          "descriptionTache": "string",
          "anomalie": {
            "idAnomalie": "${id}",
            "dataDeclenchement": "2022-05-27T08:20:27.377Z",
            "dateFin": "2022-05-27T08:20:27.377Z",
            "anomalieTraitee": false,
            "logitudePositionVehicule": 0,
            "latitudePositionVehicule": 0,
            "niveauChargeVehicule": 0,
            "temperatureVehicule": 0,
            "statutAnomalie": "EN_COURS",
            "vehicule": {
              "idVehicule": 0,
              "marque": "string",
              "matricule": "string",
              "modele": "string",
              "couleur": "string",
              "verrouillee": true,
              "enService": true,
              "am": {"amId": 0},
              "typeVehicule": {
                "idTypeVehicule": 0,
                "valTypeVehicule": "string",
                "tarifHeure": 0
              }
            }
          }
        }));
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 201) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("panne Signalée")));
      Navigator.pop(context);
    } else {
      print(response.statusCode);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("une erreur s'est produit")));
    }
  }

  Future<void> CreatEtape(BuildContext context) async {
    Map<String, dynamic> body = {
      "etapeTerminee": true,
      "idEtape": 0,
      "detailsEtape": "string",
      "tache": {
        "idTache": 0,
        "anomalie": {
          "idAnomalie": 0,
          "logitudePositionVehicule": 0,
          "latitudePositionVehicule": 0,
          "niveauChargeVehicule": 0,
          "temperatureVehicule": 0,
          "statutAnomalie": "EN_COURS",
          "dateFin": "2022-05-21T08:43:28.769Z",
          "vehicule": {
            "idVehicule": 0,
            "marque": "string",
            "matricule": "string",
            "modele": "string",
            "couleur": "string",
            "verrouillee": true,
            "enService": true,
            "amVehicule": 0,
            "am": {"amId": 0},
            "typeVehicule": {
              "idTypeVehicule": 0,
              "valTypeVehicule": "string",
              "tarifHeure": 0
            }
          }
        }
      }
    };
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
    var response = await http.post(
        Uri.parse("https://autorun-crud.herokuapp.com/etape"),
        body: body);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 201) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("anomalie crée")));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("une erreur s'est produit")));
    }
  }
}
