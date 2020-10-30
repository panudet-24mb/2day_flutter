import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:latlng/latlng.dart';
import 'package:map/map.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'package:ntp/ntp.dart';
import 'package:intl/intl.dart';
import 'package:nice_button/nice_button.dart';

class Checkin_gps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Checkin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

String ntpdate = ('date');
String ntptime = ('time');

class _MyHomePageState extends State<MyHomePage> {
  //

  //
  Future<void> _gotoDefault() async {
    //map part
    Position position = await Geolocator.getLastKnownPosition();
    double lat = position.latitude.toDouble();
    double long = position.longitude.toDouble();
    controller.center = LatLng(lat, long);
    controller.zoom = 19;
    final coordinates = new Coordinates(lat, long);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    locationname = first.featureName + ' : ' + first.addressLine;
    //time part
    DateTime _myTime;
    DateTime _ntpTime;
    _myTime = await NTP.now();
    final int offset = await NTP.getNtpOffset(localTime: DateTime.now());
    _ntpTime = _myTime.add(Duration(milliseconds: offset));
    ntptime = DateFormat('HH:mm').format(_ntpTime);
    ntpdate = DateFormat('dd:MM:yyyy').format(_ntpTime);
  }

  String locationname = 'name';
  final controller = MapController(
    location: LatLng(35.68, 51.41),
  );

  Offset _dragStart;

  double _scaleStart = 1.0;
  void _onScaleStart(ScaleStartDetails details) {
    _dragStart = details.focalPoint;
    _scaleStart = 1.0;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'demo',
//        theme: ThemeData.light().copyWith(
//          platform: _platform ?? Theme.of(context).platform,
//        ),
        home: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              title: Text('demo'),
              backgroundColor: Color(0xff0b4e82),
            ),
            body: FutureBuilder(
              future: _gotoDefault(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return SafeArea(
                    child: Column(children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height / 2.2,
                        child: GestureDetector(
                          //onDoubleTap: _onDoubleTap,
                          onScaleStart: _onScaleStart,
                          //onScaleUpdate: _onScaleUpdate,

                          child: Stack(
                            children: [
                              Map(
                                controller: controller,
                                builder: (context, x, y, z) {
                                  final url =
                                      'https://www.google.com/maps/vt/pb=!1m4!1m3!1i$z!2i$x!3i$y!2m3!1e0!2sm!3i420120488!3m7!2sen!5e1105!12m4!1e68!2m2!1sset!2sRoadmap!4e0!5m1!1e0!23i4111425';

                                  return CachedNetworkImage(
                                    imageUrl: url,
                                    fit: BoxFit.cover,
                                  );
                                },
                              ),
                              Center(
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.location_on,
                                      color: Colors.red,
                                      size: 50,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(16.0),
                          padding: EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Color(0xff0b4e82),
                            border: Border.all(),
                            borderRadius:
                                BorderRadius.all(Radius.circular(3.0)),
                          ),

                          // column of three rows
                          child: SingleChildScrollView(
                            child: Column(
                              // this makes the column height hug its content
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // first row
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Icon(
                                        Icons.location_on,
                                        color: Colors.red,
                                      ),
                                    ),
                                    Text(
                                      'คุณอยู่ที่ :',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),

                                // second row (single item)
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 16.0,
                                    horizontal: 0,
                                  ),
                                  child: Text(
                                    '   ' + locationname,
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),

                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Icon(
                                        Icons.today,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      ' วันที่ : ' + ntpdate,
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),

                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Icon(
                                        Icons.schedule,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      ' เวลา : ' + ntptime,
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                // third row
                                const SizedBox(height: 20),
                                TextField(
                                  decoration: InputDecoration(
                                    filled: true,
                                    border: OutlineInputBorder(),
                                    labelText: 'หมายเหตุ',
                                    fillColor: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 30),
                                NiceButton(
                                  radius: 40,
                                  padding: const EdgeInsets.all(15),
                                  text: "Check in",
                                  icon: Icons.done_outline_rounded,
                                  gradientColors: [
                                    Color(0xff6190E8),
                                    Color(0xffA7BFE8)
                                  ],
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]),
                  );
                } else if (snapshot.hasError) {
                  throw snapshot.error;
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ));
  }
}
