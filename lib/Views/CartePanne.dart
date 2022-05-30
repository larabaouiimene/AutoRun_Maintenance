import 'package:autorun/Views/PannePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:autorun/Modeles/tache.dart';
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

import 'package:autorun/assets/Batterie.dart';
import 'package:autorun/assets/PanneIcon.dart';
import 'package:autorun/assets/Password.dart';
import 'package:autorun/assets/Unlock.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:autorun/Views/cars_model.dart';
import 'package:autorun/Views/Location_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:autorun/utils/globals.dart' as globals;
import 'package:http/http.dart' as http;

class Carte extends StatefulWidget {
  @override
  _CarteState createState() => _CarteState();
}

class _CarteState extends State<Carte> {
  static const color = Color(0XFF4361EE);
  late GoogleMapController mapController; //contrller for Google map
  final Set<Marker> markers = new Set();
  var locationMessage =
      "${globals.tache.anomalie.lalitudePositionVehicule}, ${globals.tache.anomalie.logitudePositionVehicule}";
  var lat = globals.tache.anomalie.lalitudePositionVehicule;
  var log = globals.tache.anomalie.lalitudePositionVehicule;
  // static const LatLng showLocation = LatLng(27.7089427, 85.3086209);
  LatLng showLocation = LatLng(0, 0);
  late GoogleMapController _controller;

  @override
  Widget build(BuildContext context) {
    showLocation = LatLng(lat, log);
    return Scaffold(
        body: Column(
      children: [
        /* TextButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Panne()));
            },
            child: Icon(
              NewIcon.angle_right,
              color: Colors.white,
            )),*/
        Container(
          height: 500,
          child: GoogleMap(
            //Map widget from google_maps_flutter package
            zoomGesturesEnabled: true, //enable Zoom in, out on map
            initialCameraPosition: CameraPosition(
              //innital position in map
              target: showLocation, //initial position
              zoom: 15.0, //initial zoom level
            ),
            markers: getmarkers(), //markers to show on map
            mapType: MapType.normal, //map type
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            onMapCreated: (controller) {
              //method called when map is created
              setState(() {
                mapController = controller;
              });
            },
          ),
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20)),
            boxShadow: [
              BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
            ],
          ),
          child: Column(
            children: [
              Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 30),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                    "${globals.tache.anomalie.vehicule?.marque} ${globals.tache.anomalie.vehicule?.modele}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Nunito',
                                        fontSize: 25,
                                        color: Colors.white)),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Batterie.icon_awesome_battery_full,
                                  size: 15,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                    "${globals.tache.anomalie.niveauChargeVehicule} %",
                                    style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontSize: 15,
                                        color: Colors.white))
                              ],
                            )
                          ],
                        ),
                      ),
                      Image.asset(
                        "assets/imgs/Audi-R8.png",
                        width: 150,
                      )
                    ],
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                  height: 100,
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
                    margin: EdgeInsets.only(left: 40, top: 20, right: 20),
                    child: Column(children: [
                      SizedBox(
                        height: 20,
                      ),
                      Column(children: [
                        Row(
                          children: [
                            Icon(
                              NewIcon.road,
                              color: color,
                              size: 20,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                                globals.tache.anomalie.vehicule!.enService
                                    ? " En service"
                                    : " Non service",
                                style: TextStyle(fontFamily: 'Nunito'))
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(
                              NewIcon.unlock,
                              color: color,
                              size: 20,
                            ),
                            SizedBox(width: 10),
                            Text(
                                globals.tache.anomalie.vehicule!.verrouillee
                                    ? "Verrouillé"
                                    : "Déverrouillé",
                                style: TextStyle(fontFamily: 'Nunito'))
                          ],
                        ),
                      ])
                    ]),
                  ))
            ],
          ),
        )
      ],
    ));
  }

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
}
