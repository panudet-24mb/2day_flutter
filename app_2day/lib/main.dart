import 'package:flutter/material.dart';
import 'package:app_2day/views/ui/splash_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json, base64, ascii;

// const SERVER_IP = 'http://10.0.2.2:7000';
const SERVER_IP = 'http://192.168.1.50:7000';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: Color(0xffe9ebee),
            primaryColor: Colors.blue,
            accentColor: Colors.pinkAccent),
        home: SplashPage());
  }
}