// ignore_for_file: file_names

import 'package:autorun/Views/Authentification.dart';

import 'package:flutter/material.dart';

const color = Color(0xFF4361EE);

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);
  // ignore: prefer_typing_uninitialized_variables

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Container(
                margin: const EdgeInsets.only(top: 50, left: 30),
                child: Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  children: <Widget>[
                    Row(
                      children: [
                        //  Image.asset("assets/imgs/bienvenu.png"),
                        Text(
                          "Bienvenue 👋",
                          style: TextStyle(
                              fontSize: 35,
                              color: color,
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          "Pour continuer connectez-vous !",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.grey,
                              fontFamily: 'Nunito'),
                        )
                      ],
                    )
                  ],
                )),
            Container(
              margin:
                  const EdgeInsets.symmetric(vertical: 60.0, horizontal: 10.0),
              child: Center(
                  child: Image.asset(
                "assets/imgs/agent.png",
              )),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              margin:
                  const EdgeInsets.symmetric(vertical: 75.0, horizontal: 10.0),
              height: 55,
              width: 280,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: color),
              child: MaterialButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginForm()));
                  },
                  child: const Text(
                    "Se connecter",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontFamily: 'Nunito'),
                  )),
            ),
          ],
        ));
  }
}
