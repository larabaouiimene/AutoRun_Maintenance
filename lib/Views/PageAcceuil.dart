import 'package:autorun/Views/Home.dart';
import 'package:autorun/Views/PannePage.dart';
import 'package:autorun/Views/ProfilPage.dart';
import 'package:autorun/Views/TachesPage.dart';
import 'package:autorun/Views/VehiculesPage.dart';
import 'package:autorun/assets/MyIcons.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:flutter/material.dart';

const color = Color(0xFF4361EE);

class PageAccuiel extends StatefulWidget {
  @override
  HomePage createState() => HomePage();
}

// ignore: must_be_immutable
class HomePage extends State<PageAccuiel> {
  @override
  int _selectedIndex = 0;
  final screens = [Home(), MesTaches(), MesVehicules(), ProfilPage()];

  Widget build(BuildContext context) {
    return Scaffold(
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
            index: _selectedIndex,
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
                    SizedBox(
                      height: 5,
                    ),
                    Text("Home",
                        style: TextStyle(fontSize: 10, fontFamily: 'Nunito'))
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
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Tâches",
                      style: TextStyle(fontSize: 10, fontFamily: 'Nunito'),
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
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Véhicules",
                      style: TextStyle(fontSize: 10, fontFamily: 'Nunito'),
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
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Profil",
                      style: TextStyle(fontSize: 10, fontFamily: 'Nunito'),
                    )
                  ],
                ),
              )
            ],
            onTap: (index) => setState(() => this._selectedIndex = index),
          ),
        ),
        body: Center(
          child: screens[_selectedIndex],
        ));
  }
}
