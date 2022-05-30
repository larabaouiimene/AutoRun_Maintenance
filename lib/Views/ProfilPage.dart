import 'dart:convert';

import 'package:autorun/Modeles/GetUserCoordonnes.dart';
import 'package:autorun/Views/Authentification.dart';
import 'package:autorun/Views/PageAcceuil.dart';
import 'package:autorun/assets/MyIcons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:autorun/assets/MyFlutterApp.dart';
import 'package:http/http.dart' as http;
import 'package:autorun/utils/globals.dart' as globals;

import '../assets/Password.dart';

const color = Color(0XFF4361EE);

class ProfilePage extends StatefulWidget {
  @override
  Profile createState() => Profile();
}

// ignore: must_be_immutable
class Profile extends State<ProfilePage> {
  final double coverHeight = 100;
  final double profilHeight = 144;
  final _formKey = GlobalKey<FormState>();
  var emailContoller = TextEditingController();
  bool ishidenPassword = true;
  var passwordController = TextEditingController();
  var passwordController2 = TextEditingController();
  TextEditingController nomController = TextEditingController();
  TextEditingController prenomController = TextEditingController();
  TextEditingController numController = TextEditingController();

  void initState() {
    emailContoller.text = globals.user.email!;
    nomController.text = globals.user.nom.toString();
    prenomController.text = globals.user.prenom.toString();
    numController.text = globals.user.num_tel.toString();
  }

  @override
  Widget build(BuildContext context) {
    var nom = globals.user.nom;
    final top = coverHeight;
    final bottom = profilHeight * 2;
    initState();

    return Scaffold(
        body: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        buildTop(),
        buildContent(context),
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

  Widget buildContent(BuildContext context) {
    initState();
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${globals.user.nom} " + "${globals.user.prenom}",
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
                child: TextField(
                  controller: prenomController,
                  decoration: const InputDecoration(
                      labelText: 'Prenom',
                      prefixIcon: Icon(
                        MyIcons.user,
                        color: color,
                      )),
                ),
              ),
              SizedBox(
                width: 145,
                child: TextFormField(
                  controller: nomController,
                  decoration: const InputDecoration(
                      labelText: "Nom",
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
                labelText: "Email",
                prefixIcon: Icon(
                  MyFlutterApp.envelope,
                  color: color,
                )),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: numController,
            decoration: const InputDecoration(
                labelText: "Tel",
                prefixIcon: Icon(
                  Icons.phone,
                  color: color,
                )),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Saisir un mot de passe';
                }
                if (value.length < 6) {
                  return "Doit contenir au moins 6 characteres";
                }
                if (value.length > 15) {
                  "Ne doit pas contenir plus de 15 characteres";
                }

                return null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: passwordController2,
              keyboardType: TextInputType.visiblePassword,
              obscureText: ishidenPassword,
              decoration: InputDecoration(
                labelText: "Ancien mot de passe",
                focusColor: color,
                hoverColor: color,
                prefixIcon: Icon(Password.lock),
                suffix: InkWell(
                  onTap: _togglePasswordView,
                  child: Icon(
                    ishidenPassword ? Icons.visibility_off : Icons.visibility,
                    color: color,
                  ),
                ),
              )),
          SizedBox(
            height: 10,
          ),
          TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Saisir un mot de passe';
                }
                if (value.length < 6) {
                  return "Doit contenir au moins 6 characteres";
                }
                if (value.length > 15) {
                  "Ne doit pas contenir plus de 15 characteres";
                }

                return null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: passwordController,
              keyboardType: TextInputType.visiblePassword,
              obscureText: ishidenPassword,
              decoration: InputDecoration(
                labelText: "Nouveau mot de passe",
                focusColor: color,
                hoverColor: color,
                prefixIcon: Icon(Password.lock),
                suffix: InkWell(
                  onTap: _togglePasswordView,
                  child: Icon(
                    ishidenPassword ? Icons.visibility_off : Icons.visibility,
                    color: color,
                  ),
                ),
              )),
          SizedBox(
            height: 70,
          ),
          Container(
            height: 50,
            width: 250,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: color),
            child: MaterialButton(
                onPressed: () {
                  updateUserTextData(globals.user.id.toString(), context);
                },
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

  void _togglePasswordView() {
    setState(() {
      ishidenPassword = !ishidenPassword;
    });
  }

  updateUserTextData(String id, BuildContext context) async {
    var response = await http.post(
        Uri.parse(
            'https://wyerkn74ia.execute-api.eu-west-3.amazonaws.com/login/am'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': emailContoller.text,
          'mdp': passwordController2.text
        }));
    print('Response status: ${response.body}');
    if (response.statusCode == 200) {
      var response1 = await http.put(
          Uri.parse(
              'https://wyerkn74ia.execute-api.eu-west-3.amazonaws.com/am/${id}'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'email': emailContoller.text,
            'num_tel': numController.text,
            'prenom': prenomController.text,
            'nom': nomController.text,
            'mdp': passwordController.text
          }));

      if (response1.statusCode == 200) {
        globals.user = User(
            mdp: passwordController.text,
            nom: nomController.text,
            prenom: prenomController.text,
            num_tel: numController.text,
            email: emailContoller.text,
            id: globals.user.id);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PageAccuiel()));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
                "                    Votre modification est enregistrée")));
      }

      /* var reponse = await http.get(
        Uri.parse(
            'https://wyerkn74ia.execute-api.eu-west-3.amazonaws.com/am/${id}'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (reponse == 200) {
        var data = jsonDecode(reponse.body);
        var jsonData = json.decode(reponse.body);

        List<User> users = [];

        for (var k in jsonData.keys) {
          var u = jsonData[k];
          globals.user = User(
              mdp: u["mdp"],
              nom: u["nom"],
              prenom: u["prenom"],
              num_tel: u["num_tel"],
              email: u["email"],
              id: u["id"]);
        }
        initState();
      }*/
      initState();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("l'ancien mot de passe est incorrect")));
    }
  }
}
