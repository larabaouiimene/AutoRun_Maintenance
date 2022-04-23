import 'package:autorun/Views/PannePage.dart';
import 'package:autorun/assets/Menu.dart';
import 'package:autorun/assets/MyIcons.dart';
import 'package:autorun/assets/NewIcon.dart';
import 'package:autorun/assets/Next.dart';
import 'package:autorun/widgets/TachesList.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:flutter/material.dart';

const color = Color(0xFF4361EE);

class MesTaches extends StatelessWidget {
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
                            "Mes taches",
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
                            children: [
                              Text(
                                "Vous avez 3 taches",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'Nunito',
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                            height: 500,
                            child: ListView(children: <Widget>[
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
                            ])),
                      ],
                    ),
                  ))
            ])));
  }
}
