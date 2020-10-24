import 'package:flutter/material.dart';
import 'package:app_2day/models/login.dart';

class InputWidget extends StatefulWidget{
  @override
  _InputWidgetState  createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  final UserLogin user = new UserLogin();


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 40, bottom: 30),
      child: Container(
        width: MediaQuery.of(context).size.width - 40,
        child: Material(
          elevation: 10,
          color: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30.0),
                  topRight: Radius.circular(0.0))),
          child: Padding(
            padding: EdgeInsets.only(left: 40, right: 20, top: 10, bottom: 10),
            child: TextField(
              onChanged: (text) {
                setState((){
                  this.user.user_citizenid = text;
                  print(this.user.user_citizenid);
                });
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "1XX0501XX064X",
                  hintStyle: TextStyle(color: Color(0xFFE1E1E1), fontSize: 14)),
            ),
          ),
        ),
      ),
    );
  }
}
