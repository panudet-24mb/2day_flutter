import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  final idController = new TextEditingController();

  void dispose() {
    idController.dispose();
    super.dispose();
  }

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
                    Padding(
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
                            padding: EdgeInsets.only(
                                left: 40, right: 20, top: 10, bottom: 10),
                            child: TextField(
                              controller: idController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "1XX0501XX064X",
                                  hintStyle: TextStyle(
                                      color: Color(0xFFE1E1E1), fontSize: 14)),
                            ),
                          ),
                        ),
                      ),
                    ),
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
                                    color: Color(0xff0b4e82), // button color
                                    child: InkWell(
                                      splashColor: Colors.red, // inkwell color
                                      child: SizedBox(
                                          width: 56,
                                          height: 56,
                                          child: Icon(
                                              Icons.arrow_forward_ios_outlined,
                                              color: Colors.white)),
                                      onTap: () {
                                        var id = idController.text;
                                        print(id);
                                      },
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
