// ignore_for_file: file_names

import 'package:autorun/Views/PageAcceuil.dart';
import 'package:autorun/Views/test.dart';
import 'package:autorun/assets/MyFlutterApp.dart';
import 'package:autorun/assets/Password.dart';
import 'package:flutter/material.dart';

const color = Color(0XFF4361EE);

class Authentification extends StatelessWidget {
  const Authentification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
            padding: const EdgeInsets.only(left: 0, top: 70),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 30, right: 30),
                  child: Column(
                    children: [
                      Column(children: [
                        Wrap(spacing: 15, runSpacing: 15, children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset("assets/imgs/Rebienvenu.png"),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const Text(
                                "Pour continuer , Enter votre email \n et mot de passe",
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ]),
                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 20,
                                width: 50,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                    labelText: "Votre email",
                                    prefixIcon: Icon(MyFlutterApp.envelope)),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                      labelText: "Votre mot de passe",
                                      focusColor: color,
                                      hoverColor: color,
                                      prefixIcon: Icon(Password.lock),
                                      suffixIcon: Icon(Icons.remove_red_eye))),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                      onPressed: () {},
                                      child: const Text(
                                        "Forget Password ?",
                                        style: TextStyle(color: color),
                                      ))
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 70),
                          height: 60,
                          width: 280,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: color),
                          child: MaterialButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage()));
                              },
                              child: const Text(
                                "Se connecter",
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white),
                              )),
                        ),
                      ]),
                    ],
                  ),
                )
              ],
            )));
  }
}
