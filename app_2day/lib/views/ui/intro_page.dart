import 'package:flutter/material.dart';

import 'package:app_2day/views/utils/intro_item.dart';
import 'package:app_2day/views/ui/main_page.dart';
class IntroScreen extends StatefulWidget {
  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<IntroScreen> {
  double currentPage = 0.0;
  final _pageViewController = new PageController();
  static const _kDuration = const Duration(milliseconds: 800);
  static const _kCurve = Curves.ease;

  List<Widget> slides = IntroPage.map(
        (item) => Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(item['background']),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            flex: 3,
            child: Image.asset(
              item['image'],
              height: 520,
            ),
          ),
          Flexible(
            flex: 1,
            child: Text(
              item['header'],
              style: TextStyle(color: Colors.white, fontSize: 50),
            ),
          ),
          SizedBox(height: 15),
          Flexible(
            flex: 1,
            child: Text(
              item['description'],
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ],
      ),
    ),
  ).toList();

  List<Widget> indicator() => List<Widget>.generate(
      slides.length,
          (index) => Container(
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        height: 10.0,
        width: currentPage.round() == index ? 22.0 : 10.0,
        decoration: BoxDecoration(
            border: currentPage.round() == index
                ? Border.all(color: Colors.white)
                : Border.all(width: 2, color: Colors.white70),
            color: currentPage.round() == index
                ? Colors.white
                : Colors.white70,
            borderRadius: BorderRadius.circular(20.0)),
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            PageView.builder(
              controller: _pageViewController,
              itemCount: slides.length,
              itemBuilder: (BuildContext context, int index) {
                _pageViewController.addListener(() {
                  setState(() {
                    currentPage = _pageViewController.page;
                  });
                });
                return slides[index];
              },
            ),
            Align(
              alignment: Alignment(0, -0.09),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: indicator(),
              ),
            ),
            Align(
              alignment: Alignment(0, 0.75),
              child: currentPage.round() == slides.length - 1
                  ? OutlineButton(
                onPressed: ()  {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainPage()),
                  );

                },
                textColor: Colors.white,
                splashColor: Colors.transparent,
                highlightColor: Colors.white70,
                borderSide: BorderSide(
                    color: Colors.white,
                    width: 2.0,
                    style: BorderStyle.solid),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    side: BorderSide(color: Colors.white)),
                padding: EdgeInsets.only(
                    left: 80, right: 80, top: 15, bottom: 15),
                child: Text(
                  'Sign up',
                  style: TextStyle(fontSize: 20),
                ),
              )
                  : SizedBox(),
            ),
            Align(
              alignment: Alignment(0.95, -0.90),
              child: currentPage.round() != slides.length - 1
                  ? FlatButton(
                  onPressed: () => _pageViewController.animateToPage(2,
                      duration: _kDuration, curve: _kCurve),
                  child: Text(
                    "Skip >>",
                    style: TextStyle(color: Colors.white),
                  ))
                  : SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}