import 'package:autorun/assets/Flutter.dart';
import 'package:autorun/assets/NewIcon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

const color = Color(0XFF4361EE);

class MenuPage extends StatefulWidget {
  @override
  Menu createState() => Menu();
}

// ignore: must_be_immutable
class Menu extends State<MenuPage> {
  final double coverHeight = 100;
  final double profilHeight = 144;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        Container(
          color: color,
          child: Column(
            children: [
              buildTop(),
              buildContent(context),
            ],
          ),
        )
      ],
    ));
  }

  Widget buildCoverCoantainer() => Container(
        width: double.infinity,
        height: 300,
      );
  Widget buildProfileImage() => CircleAvatar(
        radius: profilHeight / 2,
        backgroundColor: Colors.grey.shade800,
        backgroundImage: AssetImage("assets/imgs/avatar2.jpg"),
      );
  Widget buildTop() {
    final bottom = profilHeight / 2;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          color: color,
          child: buildCoverCoantainer(),
        ),
        Positioned(top: 60, child: buildProfileImage()),
      ],
    );
  }

  Widget buildContent(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20))),
        child: Container(
          margin: EdgeInsets.only(left: 30, right: 30),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  NewIcon.angle_right,
                  color: color,
                ),
                Text(
                  "Profile",
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 20,
                  ),
                ),
                TextButton(onPressed: () {}, child: Icon(NewIcon.angle_right))
              ],
            )
          ]),
        ));
  }
}
