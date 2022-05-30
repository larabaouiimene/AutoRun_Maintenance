// ignore_for_file: file_names

import 'package:autorun/Modeles/GetUserCoordonnes.dart';
import 'package:autorun/Views/Home.dart';
import 'package:autorun/Views/PannePage.dart';
import 'package:http/http.dart' as http;
import 'package:autorun/Views/PageAcceuil.dart';
import 'package:autorun/assets/MyFlutterApp.dart';
import 'package:autorun/assets/Password.dart';
import 'package:flutter/material.dart';
import 'package:autorun/utils/globals.dart' as globals;

import 'package:form_field_validator/form_field_validator.dart';

import 'dart:convert';

import 'package:validators/validators.dart';

import '../assets/NewIcon.dart';

const color = Color(0XFF4361EE);

/*class EmailFieldValidator {
  static String? validate(String value) {
    return value.isEmpty ? 'Email can\'t be empty' : null;
  }
}

class PasswordFieldValidator {
  static String? validate(String value) {
    return value.isEmpty ? 'Password can\'t be empty' : null;
  }
}*/
class EmailFieldValidator {
  static String? validate(String value) {
    if (value.isEmpty ||
        !RegExp(r'^[\w-\,]+@([\w-]+\.)[\w-]{2,4}').hasMatch(value))
      return "Email can't be empty or invalid";
    return null;
  }
}

class PasswordFieldValidator {
  static String? validate(String value) {
    if (value.isEmpty || value.length < 6 || value.length > 15)
      return "Password can't be empty or invalid";
    return null;
  }
}

class resetPasswordForm extends StatefulWidget {
  @override
 resetPassword createState() => resetPassword();
}

// ignore: must_be_immutable
class resetPassword extends State<resetPasswordForm> {
  List _items = [];
  bool ishidenPassword = true;
    bool ishidenPassword2 = true;
      bool ishidenPassword3 = true;
        var passwordController = TextEditingController();
  var passwordController2 = TextEditingController();
  var emailContoller = TextEditingController();
  var passwordController3 = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  User get user => user;

  set user(User user) {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body:  Padding(
            padding: const EdgeInsets.only(left: 0, top: 50),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 30, right: 30),
                  child: Column(
                    children: [
                      Container(
          child: Column(
            children: [
                              Row(
                                    children: [
           Icon(
                            NewIcon.angle_right,
                            color: color,
                            size: 30,
                          ),
                                    ],
                                  ),
                                   SizedBox(
            height: 20,
          ),
              Wrap(spacing: 15, runSpacing: 15, children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                children: [  
                  
                          
                                  Text(
                                "Changer votre mot",
                                style: TextStyle(
                                    color: color,
                                    fontSize: 30,
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.bold),
                              ),Text(
                                "de passe",
                                style: TextStyle(
                                    color: color,
                                    fontSize: 30,
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.bold),
                              ),

                                ],
                              )
                              // Image.asset("assets/imgs/Rebienvenu.png"),
                            
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const Text(
                                "Saisissez un nouveau mot de passe \n pour votre compte. ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    fontFamily: 'Nunito',
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                        ]),
                                SizedBox(
            height: 20,
          ),
          Column(
            
            children: [
              Row(
                children: [
   Text(
                                "Mot de passe actuel",
                                style: TextStyle(
                                  
                                    color: color,
                                    fontSize: 15,
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.bold),
                                   

                              ),
                ],
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
                labelText: "votre mot de passe",
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

            ],
          ),
           
          SizedBox(
            height: 10,
          ),
             Column(
            
            children: [
              Row(
                children: [
   Text(
                                "Mot de passe ",
                                style: TextStyle(
                                  
                                    color: color,
                                    fontSize: 15,
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.bold),
                                   

                              ),
                ],
              ),
          TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'votre un mot de passe';
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
              obscureText: ishidenPassword2,
              decoration: InputDecoration(
                labelText: "votre nouveau mot de passe",
                focusColor: color,
                hoverColor: color,
                prefixIcon: Icon(Password.lock),
                suffix: InkWell(
                   onTap: _togglePasswordViewtwo,
                  child: Icon(
                    ishidenPassword2 ? Icons.visibility_off : Icons.visibility,
                    color: color,
                  ),
                ),
              )),]),
               SizedBox(
            height: 10,
          ),
             Column(
            
            children: [
              Row(
                children: [
   Text(
                                "Confirmation du mot de passe",
                                style: TextStyle(
                                  
                                    color: color,
                                    fontSize: 15,
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.bold),
                                   

                              ),
                ],
              ),
          TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'votre un mot de passe';
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
              controller: passwordController3,
              keyboardType: TextInputType.visiblePassword,
              obscureText: ishidenPassword3,
              decoration: InputDecoration(
                labelText: "votre nouveau mot de passe",
                focusColor: color,
                hoverColor: color,
                prefixIcon: Icon(Password.lock),
                suffix: InkWell(
                   onTap: _togglePasswordView3,
                  child: Icon(
                    ishidenPassword3 ? Icons.visibility_off : Icons.visibility,
                    color: color,
                  ),
                ),
              )),]),
          SizedBox(
            height: 120,
          ),
          Container(
            height: 50,
            width: 250,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: color),
            child: MaterialButton(
                onPressed: () {
                  openDialog(); 
                  // updateUserTextData(globals.user.id.toString(), context);
                },
                child: const Text(
                  "Sauvegarder",
                  style: TextStyle(
                      fontSize: 20, color: Colors.white, fontFamily: 'Nunito'),
                )),
          ),
            ],
          )
        )],)
        
        )],)
        )) ;}
          void _togglePasswordView() {
    setState(() {
      ishidenPassword = !ishidenPassword;
    });
     
  }
        void _togglePasswordViewtwo() {
    setState(() {
      ishidenPassword2 = !ishidenPassword2;
    });
  }
        void _togglePasswordView3() {
    setState(() {
      ishidenPassword3 = !ishidenPassword3;
    });
  }
  Future openDialog() => showDialog(context: context, builder:(context)=> AlertDialog(
title: Text('Mot de passe modifié !',
 style: TextStyle(
                         fontWeight: FontWeight.bold,fontSize: 20, color: color, fontFamily: 'Nunito'),),
                    content:  Text(
                                "Votre demande a été envoyée avec succèe. ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    fontFamily: 'Nunito',
                                    color: Colors.black),
                              ),
                              actions: [
                                TextButton(onPressed: retour, child: Text("Retour", style: TextStyle(
                         fontWeight: FontWeight.bold,fontSize: 20, color: color, fontFamily: 'Nunito')))
                              ],

  ),

  );
  void retour(){
    Navigator.of(context).pop(); 
  }
  }




