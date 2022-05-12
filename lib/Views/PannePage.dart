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

class PannePage extends StatelessWidget {
  static const color = Color(0XFF4361EE);
  final Tache tache;
  PannePage(this.tache);
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
                                            " ${tache..anomalie?.dataDeclenchement}",
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
                                                  "${tache.anomalie?.vehicule?.marque} ",
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
                                                  "${tache.anomalie?.niveauChargeVehicule}" +
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
                                                    color: Colors.grey))
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
                                                      color: Colors.grey))))),
                                  SizedBox(
                                    height: 80,
                                  ),*/
                                  Container(
                                    alignment: Alignment.bottomCenter,
                                    height: 50,
                                    width: 250,
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
                                              fontSize: 20,
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
}
