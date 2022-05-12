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

class Panne extends StatefulWidget {
  @override
  _PanneState createState() => _PanneState();
}

class _PanneState extends State<Panne> {
  static const color = Color(0XFF4361EE);
  late GoogleMapController mapController; //contrller for Google map
  final Set<Marker> markers = new Set();
  var locationMessage =
      "${globals.tache.anomalie?.lalitudePositionVehicule}, ${globals.tache.anomalie?.logitudePositionVehicule}";
  static const LatLng showLocation = LatLng(27.7089427, 85.3086209);
  late GoogleMapController _controller;

  @override
  Widget build(BuildContext context) {
    print(globals.tache.anomalie?.lalitudePositionVehicule);

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
                                            " ${globals.tache..anomalie?.dataDeclenchement}",
                                            style: TextStyle(
                                                fontFamily: 'Nunito',
                                                fontSize: 12,
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
                                                  "${globals.tache.anomalie?.vehicule?.marque} ",
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
                                                  "${globals.tache.anomalie?.niveauChargeVehicule}" +
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
                                  /* Row(
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
                                          Icon(
                                            PanneIcon.paper_plane,
                                            color: color,
                                            size: 10,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text("500 mètres",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Nunito',
                                                  fontSize: 10,
                                                  color: Colors.black))
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
                                                  "Av.Colonel Mellah Ali,Algiers 16000 Av.Colonel Mellah Ali,Algiers 16000 Av.Colonel Mellah Ali,Algiers 16000 Av.Colonel Mellah Ali,Algiers 16000",
                                                  style: TextStyle(
                                                      fontFamily: 'Nunito',
                                                      fontSize: 15,
                                                      color: Colors.black))))),*/
                                  Text("Localisation",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Nunito',
                                          fontSize: 15,
                                          color: Colors.black)),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    width: 300,
                                    height: 300,
                                    child: GoogleMap(
                                      //Map widget from google_maps_flutter package
                                      zoomGesturesEnabled:
                                          true, //enable Zoom in, out on map
                                      initialCameraPosition: CameraPosition(
                                        //innital position in map
                                        target: showLocation, //initial position
                                        zoom: 15.0, //initial zoom level
                                      ),
                                      markers:
                                          getmarkers(), //markers to show on map
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
                                  SizedBox(height: 20),
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
                                                      DetailsTache()));
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
}
