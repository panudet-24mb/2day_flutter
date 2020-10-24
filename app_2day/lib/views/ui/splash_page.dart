import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import '../utils/intro_state.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        seconds: 2,
        navigateAfterSeconds: IntroState(),
        image: Image.asset('assets/images/logo.png'),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: TextStyle(color: Colors.blue),
        photoSize: 100.0,
        loaderColor: Colors.blue);
  }
}
