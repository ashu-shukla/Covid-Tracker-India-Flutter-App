/*
*  home_widget.dart
*  Covid Tracker
*
*  Created by Ashutosh Shukla.
*  Copyright © 2018 [Company]. All rights reserved.
    */
import 'dart:async';

import 'package:covid_tracker/home_widget/selector.dart';
import 'package:covid_tracker/home_widget/http_service.dart';
import 'package:covid_tracker/home_widget/models/district.dart';
import 'package:covid_tracker/home_widget/models/india.dart';

import 'package:flutter/material.dart';

import 'home_learnmore.dart';
import 'home_maindash.dart';
import 'home_nav.dart';

class HomeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  Future<India> country;
  Future<District> state;
  Future<String> sname;

  @override
  void initState() {
    country = httpService.fetchState();
    state = httpService.fetchDistrict();
    sname = httpService.selected();
    super.initState();
  }

  @override
  dispose() {
    super.dispose();
  }

  final HttpService httpService = HttpService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<India>(
      future: country,
      builder: (context, snapshot) {
        var country = snapshot.data;
        if (snapshot.hasData) {
          return Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            child: Column(
              children: [
                HomeNav(dat: snapshot.data.statewise),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.all(0.0),
                    scrollDirection: Axis.vertical,
                    children: <Widget>[
                      MainDash(data: snapshot.data.statewise),
                      Learnmore(),
                      FutureBuilder(
                          future: state,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Container(
                                  child: Test(
                                dat: snapshot.data.districtwise,
                                data: country.statewise,
                              ));
                            } else {
                              return Center(
                                child: Container(
                                  margin: EdgeInsets.all(20),
                                  child: Text(
                                    'Connecting to Database...',
                                    style: TextStyle(fontFamily: "Poppins"),
                                  ),
                                ),
                              );
                            }
                          }),
                    ],
                  ),
                )
              ],
            ),
          );
        } else {
          return Center(
              child: Text(
            'Connecting to server...',
            style: TextStyle(fontFamily: 'Poppins'),
          ));
        }
      },
    ));
  }
}
