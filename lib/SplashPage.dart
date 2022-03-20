// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  int duration = 0;
  Widget goToPage;
  SplashPage({Key? key, required this.goToPage, required this.duration})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: duration), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => goToPage));
    });
    return Scaffold(
        body: Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 300),
          alignment: Alignment.center,
          child: Image.asset("assets/imgs/logoo.png"),
        ),
        Container(
          margin: const EdgeInsets.only(top: 250),
          child: Image.asset(
            "assets/imgs/_FUTURA.png",
            width: 100,
          ),
        )
      ],
    ));
  }
}
