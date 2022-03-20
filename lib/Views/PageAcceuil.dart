import 'package:autorun/assets/MyIcons.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:flutter/material.dart';

const color = Color(0xFF4361EE);

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(50), topLeft: Radius.circular(50)),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: CurvedNavigationBar(
          height: 55,
          backgroundColor: Colors.white,
          buttonBackgroundColor: color,
          items: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 15),
              height: 50,
              width: 50,
              child: Column(
                children: [
                  Icon(
                    MyIcons.home,
                    size: 20,
                  ),
                  Text(
                    "Home",
                    style: TextStyle(fontSize: 10),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              height: 50,
              width: 50,
              child: Column(
                children: [
                  Icon(MyIcons.list_check, size: 20),
                  Text(
                    "Tâches",
                    style: TextStyle(fontSize: 10),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              height: 50,
              width: 50,
              child: Column(
                children: [
                  Icon(MyIcons.car, size: 20),
                  Text(
                    "Véhicules",
                    style: TextStyle(fontSize: 10),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              height: 50,
              width: 55,
              child: Column(
                children: [
                  Icon(MyIcons.user, size: 20),
                  Text(
                    "Profil",
                    style: TextStyle(fontSize: 10),
                  )
                ],
              ),
            )
          ],
          onTap: (index) {
            Visibility(
              child: Text("home"),
              visible: true,
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
            );
          },
        ),
      ),
      body: Container(color: Colors.white),
    );
  }
}
