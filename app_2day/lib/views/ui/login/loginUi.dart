import 'package:flutter/material.dart';
import 'inputWidget.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 2),
        ),
        Column(
          children: <Widget>[
            ///holds email header and inputField
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 40, bottom: 10),
                  child: Text(
                    "รหัสบัตรประชาชน",
                    style: TextStyle(fontSize: 16, color: Color(0xFF999A9A)),
                  ),
                ),
                Stack(
                  alignment: Alignment.bottomRight,
                  children: <Widget>[
                    InputWidget(),
                    Padding(
                        padding: EdgeInsets.only(right: 50),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                                child: Padding(
                              padding: EdgeInsets.only(top: 40),
                              child: Text(
                                'กรุณากรอกบัตรประชาชนเพื่อเริ่มต้นใช้งาน...',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    color: Color(0xFFA0A0A0), fontSize: 12),
                              ),
                            )),
                            Container(
                                padding: EdgeInsets.all(10),
                                child: ClipOval(
                                  child: Material(
                                    color: Colors.blue, // button color
                                    child: InkWell(
                                      splashColor: Colors.red, // inkwell color
                                      child: SizedBox(
                                          width: 56,
                                          height: 56,
                                          child: Icon(Icons.arrow_forward_ios_outlined, color:Colors.white )),
                                      onTap: () {},
                                    ),
                                  ),
                                )),
                          ],
                        ))
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 50),
            ),
          ],
        )
      ],
    );
  }
}
