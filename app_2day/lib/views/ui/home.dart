import 'package:flutter/material.dart';
import 'navigatebar.dart';
import 'FAbbar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                      CircleAvatar(
                        radius: 93.0,
                        backgroundColor: Theme.of(context).accentColor,
                        child: CircleAvatar(
                          radius: 90.0,
                          backgroundImage: NetworkImage(
                              'https://scontent.fbkk5-3.fna.fbcdn.net/v/t1.0-9/117404442_10213904508606858_2603713198847406605_n.jpg?_nc_cat=105&ccb=2&_nc_sid=7aed08&_nc_eui2=AeEmilQzhYfNc1WglI1z3XOi8tb-vNJfwFPy1v680l_AU7kQWoWl79zauUKIF-YO7qc&_nc_ohc=Df7BWLgVtNUAX9XK8lw&_nc_ht=scontent.fbkk5-3.fna&oh=c3667be88d19e22be65d0975f21bc05c&oe=5FBB0A9D'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          'คน ควยใหญ่',
                          style: Theme.of(context)
                              .textTheme
                              .headline
                              .copyWith(color: Theme.of(context).accentColor),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Text('r.phunanra@outlook.com',
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
