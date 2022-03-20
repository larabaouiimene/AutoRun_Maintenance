import 'package:autorun/SplashPage.dart';
import 'package:autorun/Views/Welcome.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashPage(duration: 3, goToPage: const WelcomePage()),
  ));
}
