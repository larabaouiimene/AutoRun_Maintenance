import 'package:autorun/assets/Batterie.dart';
import 'package:autorun/assets/Fleche.dart';
import 'package:autorun/assets/NewIcon.dart';
import 'package:autorun/assets/PanneIcon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  static const color = Color(0XFF4361EE);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
              color: Colors.grey.withOpacity(0.8),
              margin: EdgeInsets.only(top: 23),
              child: Column(children: [
                Container(
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
                ])),
                Container(
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
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontFamily: 'Nunito'),
                                        )),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 30),
                                    alignment: Alignment.bottomCenter,
                                    height: 40,
                                    width: 111,
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
                                              " 12h20",
                                              style: TextStyle(
                                                  fontFamily: 'Nunito',
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold,
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
                                                Text("Audi R8",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily: 'Nunito',
                                                        fontSize: 25,
                                                        color: color)),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  Batterie
                                                      .icon_awesome_battery_full,
                                                  size: 20,
                                                  color: color,
                                                ),
                                                SizedBox(
                                                  width: 30,
                                                ),
                                                Text("98%",
                                                    style: TextStyle(
                                                        fontFamily: 'Nunito',
                                                        fontSize: 20,
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
                                                      color: Colors.grey))
                                            ],
                                          ),
                                        )),
                                    SizedBox(
                                      height: 30,
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
                                      height: 10,
                                    ),
                                    FixedTimeline.tileBuilder(
                                      builder: TimelineTileBuilder
                                          .connectedFromStyle(
                                        connectionDirection:
                                            ConnectionDirection.after,
                                        connectorStyleBuilder:
                                            (context, index) {
                                          return (index == 1)
                                              ? ConnectorStyle.dashedLine
                                              : ConnectorStyle.solidLine;
                                        },
                                        contentsBuilder: (context, index) {
                                          return (index == 0)
                                              ? Card(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text('En attente'),
                                                  ),
                                                )
                                              : Card(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text('En cours'),
                                                  ),
                                                );
                                        },
                                        indicatorStyleBuilder:
                                            (context, index) =>
                                                IndicatorStyle.outlined,
                                        itemExtent: 40.0,
                                        itemCount: 3,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                        child: TextField(
                                      decoration: InputDecoration(
                                        suffixIcon: Icon(
                                          Fleche.groupe_1558,
                                          size: 40,
                                          color: color,
                                        ),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15))),
                                      ),
                                    )),
                                  ]),
                                )))
                      ],
                    ))
              ]))
        ],
      ),
    );
  }
}
