import 'package:autorun/Modeles/MyVehicule.dart';
import 'package:autorun/Views/Authentification.dart';
import 'package:autorun/Views/Vehicule.dart';
import 'package:autorun/assets/MyIcons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:autorun/assets/MyFlutterApp.dart';
import 'package:autorun/utils/globals.dart' as globals;

import '../assets/Next.dart';

class VehiculeWidget extends StatelessWidget {
  VehiculeWidget({
    required this.vehicule,
    required this.image,
    required this.couleur,
    required this.marque,
    required this.modele,
  });
  final Color couleur;
  final String modele;
  final String marque;
  final MyVehicule vehicule;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: couleur,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 12,
              offset: Offset(4, 4), // Shadow position
            ),
          ],
        ),
        width: 160,
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(
            height: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                child: Text(
                  "Voir détails",
                  style: TextStyle(
                      fontSize: 11,
                      decoration: TextDecoration.none,
                      color: Colors.black),
                ),
                onTap: () {
                  globals.myVehicule = vehicule;
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => VehiculePage()));
                },
              ),
              Icon(
                Next.angle_right,
                color: color,
                size: 12,
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Image.asset(
            image,
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              marque + " " + modele,
              style: TextStyle(fontSize: 15, fontFamily: 'Nunito'),
            ),
          )
        ]));
  }
}
