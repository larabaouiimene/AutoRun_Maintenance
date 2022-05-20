import 'package:autorun/Modeles/MyVehicule.dart';
import 'package:autorun/Views/Vehicule.dart';
import 'package:autorun/Views/cars_model.dart';
import 'package:autorun/assets/NewIcon.dart';
import 'package:autorun/assets/Next.dart';
import 'package:flutter/cupertino.dart';
import 'package:autorun/Views/Authentification.dart';
import 'package:autorun/assets/MyIcons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:autorun/assets/MyFlutterApp.dart';
import 'package:autorun/utils/globals.dart' as globals;

class MyVehiculeWidget extends StatelessWidget {
  MyVehiculeWidget(
      {required this.nom,
      required this.image,
      required this.enService,
      required this.verrouille,
      required this.vehicule});
  final String enService;
  final String nom;
  final String verrouille;
  final String image;
  final MyVehicule vehicule;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(17)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 4,
            offset: Offset(4, 4), // Shadow position
          ),
        ],
      ),
      width: 270,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 7,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 20,
              ),
              Text(
                nom,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Nunito',
                    fontSize: 22,
                    color: Colors.black),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.only(left: 15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
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
                            Text(enService,
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
                            Text(verrouille,
                                style: TextStyle(fontFamily: 'Nunito'))
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                    Image.asset(
                      "assets/imgs/Audi-R8.png",
                      width: 150,
                    )
                  ],
                ),
                Container(
                    height: 30,
                    width: 150,
                    child: Row(
                      children: [
                        GestureDetector(
                          child: Text(
                            "Voir les détails",
                            style: TextStyle(
                                fontSize: 17,
                                decoration: TextDecoration.none,
                                color: color),
                          ),
                          onTap: () {
                            globals.myVehicule = vehicule;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => VehiculePage()));
                          },
                        ),
                        Icon(
                          Next.angle_right,
                          color: color,
                          size: 17,
                        )
                      ],
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
