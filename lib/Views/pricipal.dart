import 'package:autorun/assets/PanneIcon.dart';
import 'package:autorun/assets/Unlock.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:autorun/Views/cars_model.dart';
import 'package:autorun/Views/Location_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _searchController = TextEditingController();
  late GoogleMapController _controller;
  static const color = Color(0XFF4361EE);
  late Animation _colorTween,
      _homeTween,
      _workOutTween,
      _iconTween,
      _drawerTween;
  List<Marker> allMarkers = [];

  late PageController _pageController;

  int prevPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    vehicules.forEach((element) {
      allMarkers.add(Marker(
          markerId: MarkerId(element.marque),
          draggable: false,
          infoWindow:
              InfoWindow(title: element.marque, snippet: element.location),
          position: element.locationCoords));
    });
    _pageController = PageController(initialPage: 1, viewportFraction: 0.8)
      ..addListener(_onScroll);
  }

  void _onScroll() {
    if (_pageController.page!.toInt() != prevPage) {
      prevPage = _pageController.page!.toInt();
      moveCamera();
    }
  }

  _coffeeShopList(index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = (_pageController.page! - index);
          value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 135.0,
            width: Curves.easeInOut.transform(value) * 350.0,
            child: widget,
          ),
        );
      },
      child: InkWell(
          onTap: () {
            showModalBottomSheet(
                context: context,
                builder: (builder) {
                  return Expanded(
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
                                flex: 2,
                                child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(20),
                                          topLeft: Radius.circular(20)),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(top: 30),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Text("Audi R8",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily: 'Nunito',
                                                          fontSize: 25,
                                                          color: Colors.white)),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text("98%",
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
                                    ))),
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
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
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                                border: Border.all(
                                                    color: Colors.black),
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: Container(
                                              margin: EdgeInsets.all(10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
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
                                                          color: Colors.grey))
                                                ],
                                              ),
                                            )),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text("Statut",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                                  Unlock.unlock,
                                                  color: color,
                                                  size: 15,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text("Déverrouillé",
                                                    style: TextStyle(
                                                        fontFamily: 'Nunito',
                                                        fontSize: 15,
                                                        color: Colors.black))
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Container(
                                          alignment: Alignment.bottomCenter,
                                          height: 50,
                                          width: 250,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: color),
                                          child: MaterialButton(
                                              onPressed: () {},
                                              child: const Text(
                                                "Déverrouiller",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white,
                                                    fontFamily: 'Nunito'),
                                              )),
                                        ),
                                      ]),
                                    )))
                          ],
                        ),
                      ));
                });
          },
          child: Stack(children: [
            Center(
                child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 20.0,
                    ),
                    height: 125.0,
                    width: 275.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blueAccent,
                            offset: Offset(0.0, 4.0),
                            blurRadius: 10.0,
                          ),
                        ]),
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white),
                        child: Row(children: [
                          Container(
                              height: 90.0,
                              width: 90.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10.0),
                                      topLeft: Radius.circular(10.0)),
                                  image: DecorationImage(
                                      image:
                                          NetworkImage(vehicules[index].image),
                                      fit: BoxFit.cover))),
                          SizedBox(width: 8.0),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  vehicules[index].marque,
                                  style: TextStyle(
                                      fontSize: 12.5,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  vehicules[index].location,
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w600),
                                ),
                                Container(
                                  width: 170.0,
                                  child: Text(
                                    vehicules[index].matricule,
                                    style: TextStyle(
                                        fontSize: 11.0,
                                        fontWeight: FontWeight.w300),
                                  ),
                                )
                              ])
                        ]))))
          ])),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 30),
          height: MediaQuery.of(context).size.height - 50.0,
          width: MediaQuery.of(context).size.width,
          child: GoogleMap(
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            zoomGesturesEnabled: true,
            zoomControlsEnabled: false,
            compassEnabled: false,
            initialCameraPosition: CameraPosition(
                target: LatLng(36.69742546502124, 3.075415949250581),
                zoom: 12.0),
            markers: Set.from(allMarkers),
            onMapCreated: mapCreated,
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            height: 170.0,
            width: MediaQuery.of(context).size.width,
            child: PageView.builder(
              controller: _pageController,
              itemCount: vehicules.length,
              itemBuilder: (BuildContext context, int index) {
                return _coffeeShopList(index);
              },
            ),
          ),
        )
      ],
    ));
  }

  void mapCreated(controller) {
    setState(() {
      _controller = controller;
      locatePosition();
    });
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

  moveCamera() {
    _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: vehicules[_pageController.page!.toInt()].locationCoords,
        zoom: 14.0,
        bearing: 45.0,
        tilt: 45.0)));
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        DiagnosticsProperty<GoogleMapController>('_controller', _controller));
  }
}
