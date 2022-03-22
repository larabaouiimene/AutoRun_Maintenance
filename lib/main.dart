import 'package:autorun/SplashPage.dart';
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
    home: SplashPage(duration: 3, goToPage: const WelcomePage()),
  ));
}
