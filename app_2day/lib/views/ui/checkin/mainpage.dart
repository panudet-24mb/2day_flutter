import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:intl/intl.dart';

class CheckinPage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<CheckinPage> {
  var _isDarkMode;

  @override
  Widget build(BuildContext context) {
    _isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _backgroundAnimWidget(),
          _cardWidget(),
        ],
      ),
    );
  }

  _themeMode() {
    DateTime dt = new DateTime.now().toLocal();
    String _time = DateFormat('HH').format(dt);
    var __time = int.parse(_time);
    print(__time);
    if (__time >= 6 && __time < 17) {
      return false;
    } else if (__time >= 17 && __time < 5) {
      return true;
    }
  }

  _backgroundAnimWidget() {
    _isDarkMode = _themeMode();

    return Center(
      child: FlareActor("assets/animations/day_night.flr",
          alignment: Alignment.center,
          fit: BoxFit.fill,
          animation: _isDarkMode ? "Daynight_normal" : "Daynight_reverse"),
    );
  }

  _cardWidget() {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            padding: EdgeInsets.only(top: 70, left: 30, right: 30),
            child: Text(
              'สวัสดีจ้า',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                  fontSize: 50,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 150,
        ),
      ],
    );
  }
}
