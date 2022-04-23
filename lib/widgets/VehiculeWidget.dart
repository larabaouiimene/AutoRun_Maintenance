import 'package:autorun/Views/Authentification.dart';
import 'package:autorun/assets/MyIcons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:autorun/assets/MyFlutterApp.dart';

import '../assets/Next.dart';

class VehiculeWidget extends StatelessWidget {
  VehiculeWidget({
    required this.vehicule,
    required this.image,
    required this.couleur,
  });
  final Color couleur;
  final String vehicule;
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
              Text(
                "Voir détails",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                    fontFamily: 'Nunito'),
              ),
              Icon(
                Next.angle_right,
                size: 10,
              ),
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
              vehicule,
              style: TextStyle(fontSize: 15, fontFamily: 'Nunito'),
            ),
          )
        ]));
  }
}
