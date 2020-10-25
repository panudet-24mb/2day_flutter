import 'package:flutter/material.dart';
import '../../../main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:app_2day/views/ui/main_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

  Future<String> attemptLogIn(String citizen_id) async {
    var url = "$SERVER_IP/api/v1/sign-in";
    var body = json.encode({"citizen_id": citizen_id});
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    final response = await http.post(url, body: body, headers: headers);
    final responseJson = json.decode(response.body);
    print(response);
    if (response.statusCode != 200) {
      displayDialog(context, "พบข้อผิดพลาด", responseJson["payload"]);
      return null;
    }
    if (response.statusCode == 200) {
      return responseJson["token"];
    }
  }

  void displayDialog(context, title, text) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(title),
          content: Text(text),
          actions: [
            FlatButton(
              onPressed: () => Navigator.pop(context, false),
              // passing false
              child: Text('Ok'),
            ),
          ],
        ),
      );

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
                                      onTap: () async {
                                        if (idController.text.length < 13 ||
                                            idController.text.length >= 14) {
                                          displayDialog(
                                              context,
                                              "รหัสบัตรประชาชนไม่ถูกต้อง",
                                              "กรุณากรอกบัตรประชาชนให้ครบ 13 หลัก");
                                        }
                                        if (idController.text.length == 13) {
                                          var jwt = await attemptLogIn(
                                              idController.text);
                                          if (jwt != null) {
                                            final prefs = await SharedPreferences.getInstance();
                                            prefs.setString('jwt', jwt);
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return MainPage();
                                            }));
                                          }
                                        }

                                        // Navigator.push(context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) {
                                        //   return MainPage();
                                        // }));
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
