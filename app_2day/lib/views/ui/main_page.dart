import 'package:flutter/material.dart';
import 'history.dart';
import 'notifications.dart';
import 'menu.dart';
import 'home.dart';
import '../ui/checkin/mainpage.dart';
import '../ui/checkin_gps/main.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

int currentTab = 0;
int _currentIndex = 0;
final List<Widget> screens = [
  HomePage(),
  HistoryPage(),
  null,
  NotificationsPage(),
  MenuPage(),
]; // to store nested tabs
final PageStorageBucket bucket = PageStorageBucket();
Widget currentScreen = HomePage(); // Our first view in viewport

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FlatButton(
        child: Icon(
          Icons.location_on,
          size: 80,
          color: Color(0xff901910),
        ),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,

        //backgroundColor: Colors.red,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return MyHomePage();
          }));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: Color(0xff0b4e82),
            ),
            title: Text('Home', style: TextStyle(color: Color(0xff0b4e82))),
            backgroundColor: Color(0xff0b4e82),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule),
            title: Text('History'),
            backgroundColor: Color(0xff0b4e82),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            title: Text(''),
            backgroundColor: Color(0xff0b4e82),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none_outlined),
            title: Text('Notifications'),
            backgroundColor: Color(0xff0b4e82),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            title: Text('Menu'),
            backgroundColor: Color(0xff0b4e82),
          ),
        ],
        onTap: (index) {
          setState(() {
            if (index == 2) {
            } else {
              _currentIndex = index;
              currentScreen = screens[_currentIndex];
            }
          });
          print(index);
          print(screens[index]);
        },
      ),
    );
  }
}
