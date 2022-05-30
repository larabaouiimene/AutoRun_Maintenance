import 'package:autorun/Modeles/tache.dart';
import 'package:autorun/Views/CartePanne.dart';
import 'package:autorun/Views/DetailsTaches.dart';
import 'package:autorun/Views/Welcome.dart';
import 'package:autorun/assets/Batterie.dart';
import 'package:autorun/assets/NewIcon.dart';
import 'package:autorun/assets/Next.dart';
import 'package:autorun/assets/PanneIcon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:battery_indicator/battery_indicator.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:autorun/utils/globals.dart' as globals;
import 'dart:convert';
import 'package:http/http.dart' as http;

class Panne extends StatefulWidget {
  @override
  _PanneState createState() => _PanneState();
}

class _PanneState extends State<Panne> {
  static const color = Color(0XFF4361EE);
  late GoogleMapController mapController; //contrller for Google map
  final Set<Marker> markers = new Set();
  var locationMessage =
      "${globals.tache.anomalie.lalitudePositionVehicule}, ${globals.tache.anomalie.logitudePositionVehicule}";
  var lat = globals.tache.anomalie.lalitudePositionVehicule;
  var log = globals.tache.anomalie.lalitudePositionVehicule;
  static const LatLng showLocation = LatLng(27.7089427, 85.3086209);
  late GoogleMapController _controller;

  @override
  Widget build(BuildContext context) {
    print(globals.tache.anomalie.lalitudePositionVehicule);

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
                                  width: 200,
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
                                                fontSize: 10,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Localisation",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Nunito',
                                              fontSize: 15,
                                              color: Colors.black)),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Carte()));
                                              },
                                              child: Text("voir la carte",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: 'Nunito',
                                                      fontSize: 10,
                                                      color: Colors.black)))
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black),
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
                                    height: 30,
                                  ),
                                  Row(
                                    children: [
                                      Text("Cause de la panne",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Nunito',
                                              fontSize: 15,
                                              color: Colors.black)),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Container(
                                          margin: EdgeInsets.all(10),
                                          child: SizedBox(
                                              child: Text(
                                                  "${globals.tache.anomalie.causePanne}",
                                                  style: TextStyle(
                                                      fontFamily: 'Nunito',
                                                      fontSize: 15,
                                                      color: Colors.black))))),
                                  SizedBox(height: 30),
                                  Container(
                                    alignment: Alignment.bottomCenter,
                                    height: 30,
                                    width: 200,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: color),
                                    child: MaterialButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Details()));
                                        },
                                        child: const Text(
                                          "Commancer la tâche",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white,
                                              fontFamily: 'Nunito'),
                                        )),
                                  ),
                                ]),
                              )))
                    ],
                  ),
                ))
          ])),
    );
  }

  /* void mapCreated(controller) {
    setState(() {
      _controller = controller;
      locatePosition();
    });
  }*/
  Position? currentPosition;
  GoogleMapController? newGoogleMapController;
  void locatePosition() async {
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();

    await Geolocator.checkPermission();
    await Geolocator.requestPermission();

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    currentPosition = position;
    LatLng latLngPosition = LatLng(position.latitude, position.longitude);
  }

  Set<Marker> getmarkers() {
    //markers to place on map
    setState(() {
      markers.add(Marker(
        //add first marker
        markerId: MarkerId(showLocation.toString()),
        position: showLocation, //position of marker
        infoWindow: InfoWindow(
          //popup info
          title: 'Marker Title First ',
          snippet: 'My Custom Subtitle',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));
    });

    return markers;
  }

  Future<void> UpdateEtat(BuildContext context, encours, terminee) async {
    print("BONJOUR");
    var etat = "";
    var id_anomalie = globals.tache.anomalie.idAnomalie;
    if (encours) {
      etat = "EN_COURS";
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
    var etat = "";

    var id_anomalie = globals.tache.anomalie.idAnomalie;
    var id_tache = globals.tache.idTache;
    etat = "TERMINEE";
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
    print(response.statusCode);
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Tâche modifiée")));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("une erreur s'est produit")));
    }
  }

  Future<void> CommancerTache(BuildContext context) async {
    var id_anomalie = globals.tache.anomalie.idAnomalie;

    var response = await http.patch(
        Uri.parse("https://autorun-crud.herokuapp.com/anomalie/${id_anomalie}"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, Object>{"statutAnomalie": "EN_COURS"}));
    print(response.statusCode);
    if (response.statusCode == 201) {
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("une erreur s'est produit")));
    }
  }

//   Future<void> ValiderTache(BuildContext context)
}
