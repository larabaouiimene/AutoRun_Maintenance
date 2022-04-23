import 'package:autorun/assets/Menu.dart';
import 'package:autorun/assets/MyIcons.dart';
import 'package:autorun/assets/Next.dart';
import 'package:autorun/assets/SlideBar.dart';
import 'package:autorun/widgets/TacheWidget.dart';
import 'package:autorun/widgets/VehiculeWidget.dart';
import 'package:flutter/material.dart';
import 'package:autorun/utils/globals.dart' as globals;

class Home extends StatelessWidget {
  static const color = Color(0XFF4361EE);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            margin: EdgeInsets.only(top: 27),
            color: color,
            child: Column(children: [
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.only(left: 35, right: 35, top: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(SlideBar.groupe_104),
                          Icon(
                            MyIcons.bell,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 8),
                        child: Column(
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  //Image.asset("assets/imgs/bonjour.png"),
                                  Text(
                                    "Bonjour 👋",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.bold),
                                  )
                                ]),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "${globals.user.nom} " +
                                      "${globals.user.prenom}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Nunito',
                                      fontSize: 25,
                                      color: Colors.white),
                                )
                              ],
                            )
                          ],
                        ),
                      )
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
                  flex: 3,
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
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Mes tâches",
                                style: TextStyle(
                                    color: color,
                                    fontSize: 22,
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.bold),
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "Voir tous",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                        fontFamily: 'Nunito'),
                                  ))
                            ],
                          ),
                        ),
                        Container(
                            height: 200,
                            child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: <Widget>[
                                  SizedBox(
                                    width: 30,
                                  ),
                                  TacheWidget(
                                      vehicule: "Lamborghini Urus",
                                      temps: "il y a 3 minutes",
                                      localisation: "Oued Smar.Alger"),
                                  TacheWidget(
                                      vehicule: "Lamborghini Urus",
                                      temps: "il y a 3 minutes",
                                      localisation: "Oued Smar.Alger"),
                                  TacheWidget(
                                      vehicule: "Lamborghini Urus",
                                      temps: "il y a 3 minutes",
                                      localisation: "Oued Smar.Alger")
                                ])),
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Mes véhicules",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Nunito',
                                    color: color,
                                    fontSize: 22),
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "Voir tous",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                        fontFamily: 'Nunito'),
                                  ))
                            ],
                          ),
                        ),
                        Container(
                            height: 140,
                            child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: <Widget>[
                                  SizedBox(
                                    width: 30,
                                  ),
                                  VehiculeWidget(
                                    vehicule: "Lamborghini Urus",
                                    image: "assets/imgs/car.png",
                                    couleur: Colors.yellow,
                                  ),
                                  VehiculeWidget(
                                    vehicule: "Lamborghini Urus",
                                    image: "assets/imgs/car.png",
                                    couleur: Colors.lightBlue,
                                  ),
                                  VehiculeWidget(
                                    vehicule: "Lamborghini Urus",
                                    image: "assets/imgs/car.png",
                                    couleur: Colors.yellow,
                                  )
                                ]))
                      ],
                    ),
                  ))
            ])));
  }
}
