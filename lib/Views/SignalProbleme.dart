import 'package:autorun/assets/NewIcon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignalPage extends StatefulWidget {
  @override
  Signal createState() => Signal();
}

const color = Color(0XFF4361EE);

// ignore: must_be_immutable
class Signal extends State<SignalPage> {
  String selectedValue = "Catégorie1";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            margin: EdgeInsets.only(left: 40, top: 60),
            child: Column(children: [
              Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Icon(NewIcon.angle_right),
                  )
                ],
              ),
              Text(
                "Signaler un problème",
                style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 30,
                    color: color,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "Vous rencontrez un problème pour votre véhicule ?",
                style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 20,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "Type du problème",
                    style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                width: 300.0,
                child: DropdownButton(
                    isExpanded: true,
                    value: selectedValue,
                    style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 15,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedValue = newValue!;
                      });
                    },
                    items: dropdownItems),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "Votre problème",
                    style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  padding: EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  width: 300.0,
                  child: TextField(
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Décrire votre problème...'),
                      style: TextStyle(
                        fontSize: 15.0,
                      )))
            ])));
  }

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Catégorie1"), value: "Catégorie1"),
      DropdownMenuItem(child: Text("Catégorie2"), value: "Catégorie2"),
      DropdownMenuItem(child: Text("Catégorie3"), value: "Catégorie3"),
      DropdownMenuItem(child: Text("Catégorie4"), value: "Catégorie4"),
    ];
    return menuItems;
  }
}
