import 'package:flutter/material.dart';
class BottomNavbar extends StatefulWidget {
  @override
  _BottomNavbarState createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {

  int _currentIndex = 0 ;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon : Icon(Icons.home),
              title: Text('Home'),
              backgroundColor: Color(0xff0b4e82),
          ),
          BottomNavigationBarItem(
              icon : Icon(Icons.schedule),
              title: Text('History'),
              backgroundColor: Color(0xff0b4e82),
          ),
          BottomNavigationBarItem(
              icon : Icon(Icons.location_on),
              title: Text('Check In'),
              backgroundColor: Color(0xff0b4e82),
          ),
          BottomNavigationBarItem(
              icon : Icon(Icons.notifications),
              title: Text('Notifications'),
              backgroundColor: Color(0xff0b4e82),
          ),
          BottomNavigationBarItem(
              icon : Icon(Icons.menu),
              title: Text('Menu'),
              backgroundColor: Color(0xff0b4e82),
          ),
        ],
      onTap: (index){
          setState(() {
            _currentIndex = index ;
          });
      },
    );
  }
}
