import 'package:autorun/Views/ProfilPage.dart';
import 'package:autorun/Views/Support.dart';
import 'package:autorun/Views/TachesPage.dart';
import 'package:autorun/Views/VehiculesPage.dart';
import 'package:autorun/assets/Flutter.dart';
import 'package:autorun/assets/MenuIcon.dart';
import 'package:autorun/assets/MyIcons.dart';
import 'package:autorun/assets/NewIcon.dart';
import 'package:autorun/assets/Next.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:autorun/utils/globals.dart' as globals;

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
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${globals.user.nom} " + "${globals.user.prenom}",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Nunito",
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              buildContent(context),
            ],
          ),
        )
      ],
    ));
  }

  Widget buildCoverCoantainer() => Container(
        width: double.infinity,
        height: 200,
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
          child: Column(children: [
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  MyIcons.user,
                  color: color,
                  size: 20,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  "Profile",
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  width: 65,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfilePage()));
                    },
                    child: Icon(Next.angle_right))
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  MyIcons.list_check,
                  color: color,
                  size: 20,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  "Mes tâches",
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  width: 25,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MesTaches()));
                    },
                    child: Icon(Next.angle_right))
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  MyIcons.car,
                  color: color,
                  size: 20,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  "Mes voitures",
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MesVehicules()));
                    },
                    child: Icon(Next.angle_right))
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  MenuIcon.info,
                  color: color,
                  size: 20,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  "Supports",
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  width: 45,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SupportPage()));
                    },
                    child: Icon(Next.angle_right))
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  MenuIcon.settings,
                  color: color,
                  size: 25,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  "Paramètres",
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  width: 25,
                ),
                TextButton(onPressed: () {}, child: Icon(Next.angle_right))
              ],
            ),
            SizedBox(
              height: 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Deconnexion",
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Icon(
                  MenuIcon.sign_out,
                  color: color,
                  size: 20,
                ),
              ],
            )
          ]),
        ));
  }
}
