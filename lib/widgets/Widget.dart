import 'dart:convert';
import 'dart:ffi';

import 'package:autorun/Views/Welcome.dart';
import 'package:autorun/assets/Fleche.dart';
import 'package:autorun/assets/Next.dart';
import 'package:autorun/assets/PanneIcon.dart';
import 'package:autorun/widgets/EnvoyerEtape.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:battery_indicator/battery_indicator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:timelines/timelines.dart';
import '../assets/Batterie.dart';
import '../assets/NewIcon.dart';
import 'package:autorun/utils/globals.dart' as globals;

MyWidget() {
  var messageController = TextEditingController();
  return Container(
    child: Column(children: [
      Container(
          padding: EdgeInsets.only(left: 20),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          width: 300.0,
          child: TextField(
              controller: messageController,
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Fleche.groupe_1558,
                    color: color,
                  ),
                  border: InputBorder.none,
                  hintText: 'message...'),
              style: TextStyle(
                fontSize: 15.0,
              ))),
      SizedBox(height: 20),
      SizedBox(height: 20),
      Container(
        alignment: Alignment.bottomCenter,
        height: 30,
        width: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: color),
        child: MaterialButton(
            onPressed: () {},
            child: const Text(
              "Valider",
              style: TextStyle(
                  fontSize: 15, color: Colors.white, fontFamily: 'Nunito'),
            )),
      ),
    ]),
  );
}
