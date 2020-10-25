import 'package:flutter/material.dart';
import 'dart:async';
import 'package:app_2day/views/ui/main_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../ui/intro_page.dart';
import '../ui/login/main_login.dart';

class IntroState extends StatefulWidget {
  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<IntroState> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);
    String _logged = (prefs.getString('jwt'));
    print(_logged);

    if (_seen == false) {
      prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new IntroScreen()));
    } else {
      if (_logged == null) {
        Navigator.of(context).pushReplacement(
            new MaterialPageRoute(builder: (context) => new LoginPage()));
        }
      if (_logged != null) {
        Navigator.of(context).pushReplacement(
            new MaterialPageRoute(builder: (context) => new MainPage()));
      }
      }

  }

  @override
  void initState() {
    super.initState();
    new Timer(new Duration(milliseconds: 200), () {
      checkFirstSeen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Text('Loading...'),
      ),
    );
  }
}
