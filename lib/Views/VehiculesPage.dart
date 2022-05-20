import 'dart:convert';
import 'package:autorun/utils/globals.dart' as globals;
import 'package:autorun/assets/NewIcon.dart';
import 'package:autorun/assets/Next.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import '../Modeles/MyVehicule.dart';
import '../widgets/MyVehiculeWidget.dart';

const color = Color(0xFF4361EE);

class MesVehicules extends StatelessWidget {
  @override
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
                            "Mes Véhicules",
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
                            children: [],
                          ),
                        ),
                        myApiWidgetVehicule()
                      ],
                    ),
                  ))
            ])));
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
                height: 500,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                        title: MyVehiculeWidget(
                      enService: "En Service",
                      image: 'assets/imgs/Audi-R8.png',
                      nom: snapshot.data[index].marque,
                      verrouille: snapshot.data[index].verrouillee
                          ? "Verrouillé"
                          : "Déverrouillé",
                      vehicule: snapshot.data[index],
                    ));
                  },
                ));
          }
        });
  }
}
