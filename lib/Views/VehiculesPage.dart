import 'package:autorun/assets/Menu.dart';
import 'package:autorun/assets/MyIcons.dart';
import 'package:autorun/assets/NewIcon.dart';
import 'package:autorun/assets/Next.dart';
import 'package:battery_indicator/battery_indicator.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:flutter/material.dart';

const color = Color(0xFF4361EE);

class MesVehicules extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            margin: EdgeInsets.only(top: 27),
            color: Colors.white,
            child: Column(children: [
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.only(left: 35, right: 35, top: 40),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            NewIcon.angle_right,
                            color: color,
                            size: 20,
                          ),
                          Text(
                            "Mes Véhicules",
                            style: TextStyle(
                                color: color,
                                fontSize: 22,
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),

                      /* Row(
                  
                      children: [
                        Image.asset("assets/imgs/bonjour.png"),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "\n ABIR BENZAAMIA",
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        )
                      ],
                    )*/
                    ],
                  ),
                ),
              ),
              Expanded(
                  flex: 6,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black38,
                            spreadRadius: 0,
                            blurRadius: 10),
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 50, right: 20, top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Vous avez 5 véhicules",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'Nunito',
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                            height: 500,
                            child: ListView(children: <Widget>[
                              SizedBox(
                                width: 30,
                              ),
                              Container(
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(17)),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          "Audi R8",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 22,
                                              color: Colors.black,
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
                                                NewIcon.paper_plane,
                                                color: color,
                                                size: 20,
                                              ),
                                              SizedBox(width: 10),
                                              Text(
                                                "A 12 kilomètres",
                                                style: TextStyle(
                                                    fontFamily: 'Nunito'),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                NewIcon.road,
                                                color: color,
                                                size: 20,
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text("En service",
                                                  style: TextStyle(
                                                      fontFamily: 'Nunito'))
                                            ],
                                          ),
                                          SizedBox(height: 10),
                                          Row(
                                            children: [
                                              Icon(
                                                NewIcon.unlock,
                                                color: color,
                                                size: 20,
                                              ),
                                              SizedBox(width: 10),
                                              Text("Déverouillé",
                                                  style: TextStyle(
                                                      fontFamily: 'Nunito'))
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                              height: 50,
                                              width: 150,
                                              child: Row(
                                                children: [
                                                  GestureDetector(
                                                    child: Text(
                                                      "Voir les détails",
                                                      style: TextStyle(
                                                          fontSize: 17,
                                                          decoration:
                                                              TextDecoration
                                                                  .none,
                                                          color: color),
                                                    ),
                                                    onTap: () {},
                                                  ),
                                                  Icon(
                                                    Next.angle_right,
                                                    color: color,
                                                    size: 17,
                                                  )
                                                ],
                                              ))
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(17)),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          "Audi R8",
                                          style: TextStyle(
                                              fontFamily: 'Nunito',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 22,
                                              color: Colors.black),
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
                                                NewIcon.paper_plane,
                                                color: color,
                                                size: 20,
                                              ),
                                              SizedBox(width: 10),
                                              Text("A 12 kilomètres",
                                                  style: TextStyle(
                                                      fontFamily: 'Nunito'))
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                NewIcon.road,
                                                color: color,
                                                size: 20,
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text("En service",
                                                  style: TextStyle(
                                                      fontFamily: 'Nunito'))
                                            ],
                                          ),
                                          SizedBox(height: 10),
                                          Row(
                                            children: [
                                              Icon(
                                                NewIcon.unlock,
                                                color: color,
                                                size: 20,
                                              ),
                                              SizedBox(width: 10),
                                              Text("Déverouillé",
                                                  style: TextStyle(
                                                      fontFamily: 'Nunito'))
                                            ],
                                          ),
                                          SizedBox(
                                            height: 50,
                                          ),
                                          Container(
                                              height: 30,
                                              width: 150,
                                              child: Row(
                                                children: [
                                                  GestureDetector(
                                                    child: Text(
                                                      "Voir les détails",
                                                      style: TextStyle(
                                                          fontSize: 17,
                                                          decoration:
                                                              TextDecoration
                                                                  .none,
                                                          color: color),
                                                    ),
                                                    onTap: () {},
                                                  ),
                                                  Icon(
                                                    Next.angle_right,
                                                    color: color,
                                                    size: 17,
                                                  )
                                                ],
                                              ))
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(17)),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          "Audi R8",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Nunito',
                                              fontSize: 22,
                                              color: Colors.black),
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
                                                NewIcon.paper_plane,
                                                color: color,
                                                size: 20,
                                              ),
                                              SizedBox(width: 10),
                                              Text("A 12 kilomètres",
                                                  style: TextStyle(
                                                      fontFamily: 'Nunito'))
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                NewIcon.road,
                                                color: color,
                                                size: 20,
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text("En service",
                                                  style: TextStyle(
                                                      fontFamily: 'Nunito'))
                                            ],
                                          ),
                                          SizedBox(height: 10),
                                          Row(
                                            children: [
                                              Icon(
                                                NewIcon.unlock,
                                                color: color,
                                                size: 20,
                                              ),
                                              SizedBox(width: 10),
                                              Text("Déverouillé",
                                                  style: TextStyle(
                                                      fontFamily: 'Nunito'))
                                            ],
                                          ),
                                          SizedBox(
                                            height: 0,
                                          ),
                                          Image.asset(
                                            "assets/imgs/audi.png",
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                              height: 30,
                                              width: 150,
                                              child: Row(
                                                children: [
                                                  GestureDetector(
                                                    child: Text(
                                                      "Voir les détails",
                                                      style: TextStyle(
                                                          fontSize: 17,
                                                          decoration:
                                                              TextDecoration
                                                                  .none,
                                                          color: color),
                                                    ),
                                                    onTap: () {},
                                                  ),
                                                  Icon(
                                                    Next.angle_right,
                                                    color: color,
                                                    size: 17,
                                                  )
                                                ],
                                              )),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ])),
                      ],
                    ),
                  ))
            ])));
  }
}

mixin RxInt {}
