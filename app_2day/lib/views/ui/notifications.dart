import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Image.asset('assets/images/logo.png',
                fit: BoxFit.contain,
                height: 32,
                alignment: FractionalOffset.center),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.chat_bubble,
                  color: Colors.white,
                ),
                onPressed: () {
                  // do something
                },
              )
            ]),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: Column(
                    children: <Widget>[
                      Text('NotificationsPage',
                          style: TextStyle(color: Colors.grey),
                          textAlign: TextAlign.center),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        //bottomNavigationBar: BottomFABbar(),
      ),
    );
  }
}
