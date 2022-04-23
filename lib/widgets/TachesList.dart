import 'package:autorun/Views/Authentification.dart';
import 'package:autorun/assets/MyIcons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:autorun/assets/MyFlutterApp.dart';

import '../Views/PannePage.dart';

class TacheListWidget extends StatelessWidget {
  TacheListWidget(
      {required this.vehicule,
      required this.temps,
      required this.localisation});
  final String vehicule;
  final String temps;
  final String localisation;
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
                width: 10,
              ),
              Text(
                "Une panne c'est produite",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: color,
                    fontFamily: 'Nunito'),
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
                  children: [
                    Icon(
                      MyIcons.car,
                      color: color,
                      size: 20,
                    ),
                    SizedBox(width: 10),
                    Text(
                      vehicule,
                      style: TextStyle(fontFamily: 'Nunito'),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      MyIcons.clock,
                      color: color,
                      size: 20,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(temps, style: TextStyle(fontFamily: 'Nunito'))
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(
                      MyIcons.marker,
                      color: color,
                      size: 20,
                    ),
                    SizedBox(width: 10),
                    Text(localisation, style: TextStyle(fontFamily: 'Nunito'))
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 30,
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35), color: color),
                  child: MaterialButton(
                      color: Colors.yellow,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PannePage()));
                      },
                      child: const Text(
                        "Voir les détails ",
                        style: TextStyle(
                            fontSize: 14, fontFamily: 'Nunito', color: color),
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
