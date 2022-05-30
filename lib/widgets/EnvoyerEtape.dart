import 'dart:convert';

import 'package:autorun/Modeles/tache.dart';
import 'package:autorun/Views/EtapePage.dart';
import 'package:autorun/Views/TachesPage.dart';
import 'package:autorun/assets/Fleche.dart';
import 'package:autorun/assets/MyIcons.dart';
import 'package:autorun/assets/NewIcon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:autorun/assets/Fleche.dart';
import 'package:autorun/utils/globals.dart' as globals;
import 'package:http/http.dart' as http;

class EnvoyerEtape extends StatelessWidget {
  EnvoyerEtape({
    required this.messageController,
  });

  final TextEditingController messageController;
  static const color = Color(0XFF4361EE);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Ajouter une étape",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Nunito',
                    fontSize: 15,
                    color: Colors.black)),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MesEtapes()));
                },
                child: const Text(
                  "Voir les étapes",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: color,
                      fontSize: 12,
                      fontFamily: 'Nunito'),
                )),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Container(
            padding: EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            width: 300.0,
            child: TextField(
                controller: messageController,
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                    suffixIcon: TextButton(
                        onPressed: () {
                          CreatEtape(context);
                        },
                        child: Icon(Fleche.groupe_1558)),
                    border: InputBorder.none,
                    hintText: 'message...'),
                style: TextStyle(
                  fontSize: 15.0,
                ))),
        SizedBox(height: 20),
        SizedBox(height: 20),
        Container(
          alignment: Alignment.bottomCenter,
          height: 40,
          width: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: color),
          child: MaterialButton(
              onPressed: () {
                UpdateTache(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MesTaches()));
              },
              child: const Text(
                "Terminer",
                style: TextStyle(
                    fontSize: 15, color: Colors.white, fontFamily: 'Nunito'),
              )),
        ),
      ]),
    );
  }

  Future<void> CreatEtape(BuildContext context) async {
    var url = "https://autorun-crud.herokuapp.com/etape";
    var response = await http.post(Uri.parse(url),
        headers: {"content-type": "application/json"},
        body: jsonEncode(<String, Object>{
          "detailsEtape": messageController.text,
          "tache": {
            "idTache": "${globals.tache.idTache}",
          }
        }));

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 201) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Etape crée")));
    } else {
      print(response.statusCode);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("une erreur s'est produit")));
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
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MesTaches()));
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("La tâche est terminée")));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("une erreur s'est produit")));
    }
  }
}
