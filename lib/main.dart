import 'package:autorun/SplashPage.dart';
import 'package:autorun/Views/MapLocation.dart';
import 'package:autorun/Views/ProfilPage.dart';
import 'package:autorun/Views/Vehicule.dart';
import 'package:autorun/Views/PannePage.dart';
import 'package:autorun/Views/Welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  final GlobalKey<NavigatorState> myNavigatorKey = GlobalKey<NavigatorState>();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MaterialApp(
      navigatorKey: myNavigatorKey,
      debugShowCheckedModeBanner: false,
      home: SplashPage(goToPage: WelcomePage(), duration: 3)));
}
//https://console.cloud.google.com/google/maps-apis/credentials?hl=fr&project=noted-amphora-346209