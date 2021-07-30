/*
*  main.dart
*  Covid Tracker
*
*  Created by Ashutosh Shukla.
*  Copyright © 2018 [Company]. All rights reserved.
    */

import 'package:covid_tracker/home_widget/home_widget.dart';
import 'package:covid_tracker/home_widget/nointernet.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

void main() => runApp(Phoenix(
      child: App(),
    ));

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  var st;
  // var isDeviceConnected = false;

  status() async {
    bool result = await DataConnectionChecker().hasConnection;
    if (result == true) {
      print('Connected!');
      return result;
    } else {
      print('No internet :( Reason:');
      print(DataConnectionChecker().lastTryResults);
    }
  }

  @override
  void initState() {
    super.initState();
    st = status();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return FutureBuilder(
        future: st,
        builder: (context, snapshot) {
          print(snapshot.data);
          if (snapshot.data == true) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(primaryColor: Color.fromARGB(255, 85, 75, 134)),
              home: HomeWidget(),
            );
          } else {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: InterError(),
            );
          }
        });
  }
}
