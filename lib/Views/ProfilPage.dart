import 'package:autorun/Views/Authentification.dart';
import 'package:autorun/assets/MyIcons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:autorun/assets/MyFlutterApp.dart';

class ProfilPage extends StatelessWidget {
  final double coverHeight = 100;
  final double profilHeight = 144;

  var emailContoller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final top = coverHeight;
    final bottom = profilHeight * 2;
    return Scaffold(
        body: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        buildTop(),
        buildContent(),
      ],
    ));
  }

  Widget buildCoverCoantainer() => Container(
        width: double.infinity,
        height: 160,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20))),
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
          margin: EdgeInsets.only(bottom: bottom),
          child: buildCoverCoantainer(),
        ),
        Positioned(top: 60, child: buildProfileImage()),
      ],
    );
  }

  Widget buildContent() {
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Mohamed Mohamed",
                style: TextStyle(
                    color: color,
                    fontFamily: "Nunito",
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                width: 145,
                child: TextFormField(
                  decoration: const InputDecoration(
                      labelText: "Mohamed",
                      prefixIcon: Icon(
                        MyIcons.user,
                        color: color,
                      )),
                ),
              ),
              SizedBox(
                width: 145,
                child: TextFormField(
                  decoration: const InputDecoration(
                      labelText: "Mohamed",
                      prefixIcon: Icon(
                        MyIcons.user,
                        color: color,
                      )),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !RegExp(r'^[\w-\,]+@([\w-]+\.)[\w-]{2,4}').hasMatch(value)) {
                return '* Entrez un email valide';
              }
              return null;
            },
            controller: emailContoller,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
                labelText: "am@futura.dz",
                prefixIcon: Icon(
                  MyFlutterApp.envelope,
                  color: color,
                )),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: const InputDecoration(
                labelText: "0777707172",
                prefixIcon: Icon(
                  Icons.phone,
                  color: color,
                )),
          ),
          SizedBox(
            height: 140,
          ),
          Container(
            height: 50,
            width: 250,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: color),
            child: MaterialButton(
                onPressed: () {},
                child: const Text(
                  "Enregistrer",
                  style: TextStyle(
                      fontSize: 20, color: Colors.white, fontFamily: 'Nunito'),
                )),
          ),
        ],
      ),
    );
  }
}
