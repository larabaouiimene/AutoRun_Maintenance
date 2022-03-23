import 'package:autorun/assets/Menu.dart';
import 'package:autorun/assets/MyIcons.dart';
import 'package:autorun/assets/Next.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:flutter/material.dart';

const color = Color(0xFF4361EE);

class HomePage extends StatelessWidget {
  @override
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
            onTap: (index) {},
          ),
        ),
        body: Container(
            margin: EdgeInsets.only(top: 27),
            color: color,
            child: Column(children: [
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.only(left: 35, right: 35, top: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(MyIcons.list_check),
                          Icon(MyIcons.bell),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 8),
                        child: Column(
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  //Image.asset("assets/imgs/bonjour.png"),
                                  Text(
                                    "Bonjour 👋",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.bold),
                                  )
                                ]),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  " LARBAOUI IMENE",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Nunito',
                                      fontSize: 25,
                                      color: Colors.white),
                                )
                              ],
                            )
                          ],
                        ),
                      )
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
                  flex: 3,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
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
                          margin: EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Mes tâches",
                                style: TextStyle(
                                    color: color,
                                    fontSize: 22,
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.bold),
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "Voir tous",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                        fontFamily: 'Nunito'),
                                  ))
                            ],
                          ),
                        ),
                        Container(
                            height: 200,
                            child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: <Widget>[
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
                                          offset:
                                              Offset(4, 4), // Shadow position
                                        ),
                                      ],
                                    ),
                                    width: 270,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 7,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
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
                                                    "Lamborghini Urus",
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
                                                    MyIcons.clock,
                                                    color: color,
                                                    size: 20,
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text("il y a 3 minutes",
                                                      style: TextStyle(
                                                          fontFamily: 'Nunito'))
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
                                                  Text("Oued Smar.Alger",
                                                      style: TextStyle(
                                                          fontFamily: 'Nunito'))
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                height: 30,
                                                width: 150,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            35),
                                                    color: color),
                                                child: MaterialButton(
                                                    color: Colors.yellow,
                                                    onPressed: () {},
                                                    child: const Text(
                                                      "Voir les détails ",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontFamily: 'Nunito',
                                                          color: color),
                                                    )),
                                              )
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
                                          offset:
                                              Offset(4, 4), // Shadow position
                                        ),
                                      ],
                                    ),
                                    width: 270,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 7,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              "Une panne c'est produite",
                                              style: TextStyle(
                                                  fontFamily: 'Nunito',
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17,
                                                  color: color),
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
                                                  Text("Lamborghini Urus",
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
                                                    MyIcons.clock,
                                                    color: color,
                                                    size: 20,
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text("il y a 3 minutes",
                                                      style: TextStyle(
                                                          fontFamily: 'Nunito'))
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
                                                  Text("Oued Smar.Alger",
                                                      style: TextStyle(
                                                          fontFamily: 'Nunito'))
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                height: 30,
                                                width: 150,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                35)),
                                                    color: color),
                                                child: MaterialButton(
                                                    color: Colors.yellow,
                                                    onPressed: () {},
                                                    child: const Text(
                                                      "Voir les détails ",
                                                      style: TextStyle(
                                                          fontFamily: 'Nunito',
                                                          fontSize: 14,
                                                          color: color),
                                                    )),
                                              )
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
                                          offset:
                                              Offset(4, 4), // Shadow position
                                        ),
                                      ],
                                    ),
                                    width: 270,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 7,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              "Une panne c'est produite",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Nunito',
                                                  fontSize: 17,
                                                  color: color),
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
                                                  Text("Lamborghini Urus",
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
                                                    MyIcons.clock,
                                                    color: color,
                                                    size: 20,
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text("il y a 3 minutes",
                                                      style: TextStyle(
                                                          fontFamily: 'Nunito'))
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
                                                  Text("Oued Smar.Alger",
                                                      style: TextStyle(
                                                          fontFamily: 'Nunito'))
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                height: 30,
                                                width: 150,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                35)),
                                                    color: color),
                                                child: MaterialButton(
                                                    color: Colors.yellow,
                                                    onPressed: () {},
                                                    child: const Text(
                                                      "Voir les détails ",
                                                      style: TextStyle(
                                                          fontFamily: 'Nunito',
                                                          fontSize: 14,
                                                          color: color),
                                                    )),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ])),
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Mes véhicules",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Nunito',
                                    color: color,
                                    fontSize: 22),
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "Voir tous",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                        fontFamily: 'Nunito'),
                                  ))
                            ],
                          ),
                        ),
                        Container(
                            height: 140,
                            child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: <Widget>[
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Container(
                                      margin: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: Colors.yellow,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: 12,
                                            offset:
                                                Offset(4, 4), // Shadow position
                                          ),
                                        ],
                                      ),
                                      width: 160,
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 2,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  "Voir détails",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                              "assets/imgs/car.png",
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Center(
                                              child: Text(
                                                "Lamborghini Urus",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontFamily: 'Nunito'),
                                              ),
                                            )
                                          ])),
                                  Container(
                                      margin: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: Colors.lightBlue,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: 12,
                                            offset:
                                                Offset(4, 4), // Shadow position
                                          ),
                                        ],
                                      ),
                                      width: 160,
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 2,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  "Voir détails",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 10,
                                                      fontFamily: 'Nunito'),
                                                ),
                                                Icon(Next.angle_right,
                                                    size: 10),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Image.asset(
                                              "assets/imgs/car.png",
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Center(
                                              child: Text(
                                                "Lamborghini Urus",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontFamily: 'Nunito'),
                                              ),
                                            )
                                          ])),
                                  Container(
                                      margin: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: Colors.yellow,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: 12,
                                            offset:
                                                Offset(4, 4), // Shadow position
                                          ),
                                        ],
                                      ),
                                      width: 160,
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 2,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  "Voir détails",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                              "assets/imgs/car.png",
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Center(
                                              child: Text(
                                                "Lamborghini Urus",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontFamily: 'Nunito'),
                                              ),
                                            )
                                          ])),
                                ]))
                      ],
                    ),
                  ))
            ])));
  }
}
