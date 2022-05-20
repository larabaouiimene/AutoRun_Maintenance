import 'package:autorun/Views/Authentification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../assets/NewIcon.dart';

class SupportPage extends StatefulWidget {
  @override
  Support createState() => Support();
}

// ignore: must_be_immutable
class Support extends State<SupportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 40, top: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                TextButton(
                  onPressed: () {},
                  child: Icon(NewIcon.angle_right),
                )
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 25,
                ),
                Text(
                  "Support",
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 25,
                      color: color,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 4,
                    offset: Offset(4, 4), // Shadow position
                  ),
                ],
              ),
              width: 270,
              height: 50,
              child: Column(children: [
                Row(
                  children: [
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      "Service technique",
                      style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 15,
                          color: color,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      "+213 777 000 000",
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 15,
                      ),
                    )
                  ],
                )
              ]),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 4,
                    offset: Offset(4, 4), // Shadow position
                  ),
                ],
              ),
              width: 270,
              height: 50,
              child: Column(children: [
                Row(
                  children: [
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      "Service commercial",
                      style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 15,
                          color: color,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      "+213 777 000 000",
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 15,
                      ),
                    )
                  ],
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
