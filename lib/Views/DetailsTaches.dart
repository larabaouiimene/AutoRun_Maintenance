import 'dart:convert';

import 'package:autorun/Views/Welcome.dart';
import 'package:autorun/assets/Fleche.dart';
import 'package:autorun/assets/Next.dart';
import 'package:autorun/assets/PanneIcon.dart';
import 'package:autorun/widgets/EnvoyerEtape.dart';
import 'package:autorun/widgets/tacheTerminee.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:battery_indicator/battery_indicator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:timelines/timelines.dart';
import '../assets/Batterie.dart';
import '../assets/NewIcon.dart';
import 'package:autorun/utils/globals.dart' as globals;

import '../widgets/Widget.dart';

class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  static const color = Color(0XFF4361EE);
  late int selectedRadioTile;
  var messageController = TextEditingController();
  var en_cours = false;
  var traitee = false;
  var en_attente = false;
  var en_cours1 = true;
  var traitee1 = false;
  late int selectedRadio;

  Widget build(BuildContext context) {
    Select(globals.tache.anomalie.statutAnomalie);
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
                    "Mes tâches",
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
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    topLeft: Radius.circular(20)),
                              ),
                              child: Row(children: [
                                Container(
                                  margin: EdgeInsets.only(left: 30),
                                  alignment: Alignment.bottomCenter,
                                  height: 40,
                                  width: 90,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.white.withOpacity(0.5)),
                                  child: MaterialButton(
                                      onPressed: () {},
                                      child: const Text(
                                        "Panne",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontFamily: 'Nunito'),
                                      )),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 30),
                                  alignment: Alignment.bottomCenter,
                                  height: 40,
                                  width: 180,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.white.withOpacity(0.5)),
                                  child: MaterialButton(
                                      onPressed: () {},
                                      child: Row(
                                        children: [
                                          Icon(Icons.timelapse,
                                              color: Colors.white),
                                          Text(
                                            " ${globals.tache.anomalie.dataDeclenchement}",
                                            style: TextStyle(
                                                fontFamily: 'Nunito',
                                                fontSize: 9,
                                                color: Colors.white),
                                          )
                                        ],
                                      )),
                                )
                              ]))),
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
                                margin: EdgeInsets.only(
                                    left: 40, top: 20, right: 20),
                                child: Column(children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                  "${globals.tache.anomalie.vehicule?.marque} ",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: 'Nunito',
                                                      fontSize: 25,
                                                      color: color)),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Icon(
                                                Batterie
                                                    .icon_awesome_battery_full,
                                                size: 15,
                                                color: color,
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Text(
                                                  "${globals.tache.anomalie.niveauChargeVehicule}" +
                                                      "%",
                                                  style: TextStyle(
                                                      fontFamily: 'Nunito',
                                                      fontSize: 15,
                                                      color: color))
                                            ],
                                          )
                                        ],
                                      ),
                                      Image.asset(
                                        "assets/imgs/Audi-R8.png",
                                        width: 150,
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      Text("Etat d'avancement",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Nunito',
                                              fontSize: 15,
                                              color: Colors.black)),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  /* RadioListTile(
                                    value: 1,
                                    groupValue: selectedRadioTile,
                                    title: Text("En attente"),
                                    activeColor: color,
                                    onChanged: (int? value) {
                                      setSelectedRadio(value!);
                                      en_cours1 = false;
                                      traitee1 = false;
                                    },
                                    selected: en_attente,
                                  ),
                                  RadioListTile(
                                    value: 2,
                                    groupValue: selectedRadioTile,
                                    title: Text("En cours"),
                                    activeColor: color,
                                    onChanged: (int? value) {
                                      setSelectedRadio(value!);
                                      en_cours1 = true;
                                      traitee1 = false;
                                    },
                                    selected: en_cours,
                                  ),
                                  RadioListTile(
                                    value: 3,
                                    groupValue: selectedRadioTile,
                                    title: Text("Traitée"),
                                    activeColor: color,
                                    onChanged: (int? value) {
                                      setSelectedRadio(value!);
                                      en_cours1 = false;
                                      traitee1 = true;
                                    },
                                    selected: traitee,
                                    autofocus: true,
                                  )*/

                                  CheckboxListTile(
                                    title: const Text('En cours'),
                                    value: en_cours,
                                    onChanged: (bool? value) {},
                                  ),
                                  CheckboxListTile(
                                    controlAffinity:
                                        ListTileControlAffinity.trailing,
                                    title: const Text('Traitée'),
                                    value: traitee,
                                    onChanged: (bool? value) {},
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  if (en_cours)
                                    EnvoyerEtape(
                                        messageController: messageController)
                                  else
                                    TacheTermine()
                                ]),
                              )))
                    ],
                  ),
                ))
          ])),
    );
  }

  Future<void> UpdateEtat(BuildContext context, encours, terminee) async {
    print("BONJOUR");
    var etat = "";
    var id_anomalie = globals.tache.anomalie.idAnomalie;
    if (encours) {
      var response = await http.patch(
          Uri.parse(
              "https://autorun-crud.herokuapp.com/anomalie/${id_anomalie}"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, Object>{"statutAnomalie": "EN_COURS"}));
      print(response.statusCode);
      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Tâche modifiée")));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("une erreur s'est produit")));
      }
    } else if (terminee) {
      etat = "TERMINEE";
      UpdateTache(context);
    }
  }

  Future<void> UpdateTache(BuildContext context) async {
    var id_anomalie = globals.tache.anomalie.idAnomalie;

    var id_tache = globals.tache.idTache;

    var response = await http.put(
        Uri.parse("https://autorun-crud.herokuapp.com/anomalie/${id_anomalie}"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, Object>{
          "anomalieTraitee": true,
          "statutAnomalie": "TERMINEE"
        }));
    print(response.statusCode);
    if (response.statusCode == 200) {
      response = await http.patch(
          Uri.parse("https://autorun-crud.herokuapp.com/tache/${id_tache}"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, Object>{
            "tache_terminee": true,
          }));
    }
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Tâche modifiée")));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("une erreur s'est produit")));
    }
  }

  Select(etat) {
    if (etat == "EN_ATTENTE") {
      en_attente = true;
      en_cours = false;
      traitee = false;
    } else if (etat == "EN_COURS") {
      en_attente = false;
      en_cours = true;
      traitee = false;
    } else {
      en_attente = false;
      en_cours = false;
      traitee = true;
    }
  }
}
