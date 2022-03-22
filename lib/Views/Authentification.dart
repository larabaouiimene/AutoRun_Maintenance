// ignore_for_file: file_names

import 'package:http/http.dart' as http;
import 'package:autorun/Views/PageAcceuil.dart';
import 'package:autorun/assets/MyFlutterApp.dart';
import 'package:autorun/assets/Password.dart';
import 'package:flutter/material.dart';

const color = Color(0XFF4361EE);

class EmailFieldValidator {
  static String? validate(String value) {
    return value.isEmpty ? 'Email can\'t be empty' : null;
  }
}

class PasswordFieldValidator {
  static String? validate(String value) {
    return value.isEmpty ? 'Password can\'t be empty' : null;
  }
}

// ignore: must_be_immutable
class Authentification extends StatelessWidget {
  var emailContoller = TextEditingController();
  var passwordController = TextEditingController();

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
                              // Image.asset("assets/imgs/Rebienvenu.png"),
                              Text(
                                "Re-bienvenue 👋",
                                style: TextStyle(
                                    color: color,
                                    fontSize: 35,
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const Text(
                                "Pour continuer , Enter votre email \n et mot de passe",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    fontFamily: 'Nunito',
                                    color: Colors.grey),
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
                                controller: emailContoller,
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                    labelText: "Votre email",
                                    prefixIcon: Icon(MyFlutterApp.envelope)),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Password can\'t be Empty';
                                    }
                                    return null;
                                  },
                                  controller: passwordController,
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
                                        "mot de passe oublié ?",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: color,
                                            fontFamily: 'Nunito'),
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
                                login(context);
                              },
                              child: const Text(
                                "Se connecter",
                                style: TextStyle(
                                    fontFamily: 'Nunito',
                                    fontSize: 25,
                                    color: Colors.white),
                              )),
                        ),
                      ]),
                    ],
                  ),
                )
              ],
            )));
  }

  Future<void> login(BuildContext context) async {
    if (passwordController.text.isNotEmpty && emailContoller.text.isNotEmpty) {
      var response = await http.post(
          Uri.parse(
              'https://s8evs8twoi.execute-api.eu-west-3.amazonaws.com/login/am'),
          body: ({
            'email': emailContoller.text,
            'mdp': passwordController.text
          }));
      print('Response status: ${response.statusCode}');
      if (response.statusCode == 201) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      } else {
        if (response.statusCode == 401) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Details manquants")));
        } else {
          if (response.statusCode == 404) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Not Found: compte enexistant")));
          } else {
            if (response.statusCode == 500) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text("Erreur Serveur")));
            }
          }
        }
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("veuillez remplir les champs")));
    }
  }
}
