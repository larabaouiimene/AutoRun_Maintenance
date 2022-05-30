import 'dart:convert';
import 'package:autorun/Modeles/Etape.dart';
import 'package:autorun/Modeles/MyVehicule.dart';
import 'package:autorun/utils/globals.dart' as globals;
import 'package:autorun/Modeles/anomalie.dart';
import 'package:autorun/Modeles/tache.dart';

import 'package:autorun/assets/NewIcon.dart';
import 'package:autorun/widgets/TachesList.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import '../Modeles/typeVehicule.dart';
import '../widgets/EtapeWidget.dart';

const color = Color(0xFF4361EE);

class MesEtapes extends StatefulWidget {
  @override
  _MesEtapesState createState() => new _MesEtapesState();
}

class _MesEtapesState extends State<MesEtapes> {
  @override
  late Future<String> _value;

  Widget build(BuildContext context) {
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
                            "Etapes",
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
                        Container(height: 500, child: myApiWidgetEtape()
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

  Future<List<Etape>> GetEtape() async {
    //  var id_tache = globals.tache.idTache;
    // print(id_tache);
    var id = globals.tache.idTache;
    var response = await http.get(
      Uri.parse(
          "https://autorun-crud.herokuapp.com/etape?&filter=tache.idTache||\$eq||${id}"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    // print("https://autorun-crud.herokuapp.com/tache?&filter=anomalie.vehicule.am||\$eq||${id_AM}");

    print(response.body);
    var jsonData = json.decode(response.body);
    List<Etape> etapes = [];
    for (var u in jsonData) {
      Etape etape = Etape(
          idEtape: u["idEtape"],
          dateDebutEtape: u["dateDebutEtape"],
          detailsEtape: u['detailsEtape']);

      etapes.add(etape);
    }

    return etapes;
  }

  myApiWidgetEtape() {
    return FutureBuilder(
        future: GetEtape(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          print(snapshot.data);

          if (snapshot.data == null) {
            return Container(
              child: Center(
                child: Text("loading..."),
              ),
            );
          } else {
            int cpt = 1;
            return Expanded(
                child: ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: EtapeWidget(
                    cpt: cpt++,
                    dateDebutEtape: snapshot.data[index].dateDebutEtape,
                    detailsEtape:
                        "HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH",
                  ),
                );
              },
            ));
          }
        });
  }
}
