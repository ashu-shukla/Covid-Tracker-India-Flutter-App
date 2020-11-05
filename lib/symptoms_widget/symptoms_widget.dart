/*
*  symptoms_widget.dart
*  Covid Tracker
*
*  Created by Ashutosh Shukla.
*  Copyright © 2018 [Company]. All rights reserved.
    */

import 'package:covid_tracker/values/values.dart';
import 'package:flutter/material.dart';

class SymptomsWidget extends StatelessWidget {
  void onViewPressed(BuildContext context) => Navigator.pop(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(66, 221, 221, 240),
                    offset: Offset(9, 9),
                    blurRadius: 30,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * .22,
                    height: MediaQuery.of(context).size.width * .1,
                    margin: EdgeInsets.only(left: 10, top: 33),
                    child: FlatButton(
                      onPressed: () => this.onViewPressed(context),
                      color: Color.fromARGB(255, 255, 255, 255),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      textColor: Color.fromARGB(255, 0, 0, 0),
                      padding: EdgeInsets.only(right: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/path-1.png",
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .9,
                    margin: EdgeInsets.only(left: 18, top: 8, bottom: 5),
                    child: Text(
                      "Symptoms",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color.fromARGB(255, 30, 30, 30),
                        fontFamily: "League Spartan",
                        fontWeight: FontWeight.w700,
                        fontSize: MediaQuery.of(context).size.width * .11,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(0.0),
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.width * .65,
                    margin: EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * .45,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 228, 239),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              boxShadow: [Shadows.primaryShadow]),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Positioned(
                                left: 0,
                                bottom: MediaQuery.of(context).size.width * .15,
                                right: 0,
                                child: Image.asset(
                                  "assets/images/chills.png",
                                  fit: BoxFit.none,
                                ),
                              ),
                              Positioned(
                                left: 0,
                                right: 0,
                                bottom: 0,
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.width * .32,
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryBackground,
                                    border: Border.fromBorderSide(
                                        Borders.primaryBorder),
                                    borderRadius: Radii.k30pxRadius,
                                  ),
                                  child: Container(),
                                ),
                              ),
                              Positioned(
                                left: 20,
                                top: MediaQuery.of(context).size.width * .36,
                                child: Text(
                                  "Chills",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 30, 30, 30),
                                    fontFamily: "League Spartan",
                                    fontWeight: FontWeight.w700,
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            .03,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 20,
                                bottom:
                                    MediaQuery.of(context).size.height * .025,
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * .38,
                                  child: Text(
                                    "The feeling of being cold, though not necessarily in a cold environment.",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 85, 75, 134),
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w400,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              .028,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 20,
                                bottom: 11,
                                child: Container(
                                  width: MediaQuery.of(context).size.width * .3,
                                  height: 2,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 114, 215, 255),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(2)),
                                  ),
                                  child: Container(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * .45,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 236, 213),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              boxShadow: [Shadows.primaryShadow]),
                          child: Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                right: 0,
                                child: Image.asset(
                                  "assets/images/fever.png",
                                  fit: BoxFit.none,
                                ),
                              ),
                              Positioned(
                                left: 0,
                                right: 0,
                                bottom: 0,
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.width * .32,
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryBackground,
                                    border: Border.fromBorderSide(
                                        Borders.primaryBorder),
                                    borderRadius: Radii.k30pxRadius,
                                  ),
                                  child: Container(),
                                ),
                              ),
                              Positioned(
                                left: 20,
                                top: MediaQuery.of(context).size.width * .36,
                                child: Text(
                                  "Fever",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 30, 30, 30),
                                    fontFamily: "League Spartan",
                                    fontWeight: FontWeight.w700,
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            .03,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 20,
                                bottom:
                                    MediaQuery.of(context).size.height * .025,
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * .38,
                                  child: Text(
                                    "A temporary increase in average body temperature of 98.6°F (37°C).",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 85, 75, 134),
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w400,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              .028,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 20,
                                bottom: 11,
                                child: Container(
                                  width: MediaQuery.of(context).size.width * .3,
                                  height: 2,
                                  decoration: BoxDecoration(
                                    color: Colors.orangeAccent,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(2)),
                                  ),
                                  child: Container(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.width * .65,
                    margin: EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * .45,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(200, 213, 255, 248),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              boxShadow: [Shadows.primaryShadow]),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Positioned(
                                left: 0,
                                bottom: MediaQuery.of(context).size.width * .05,
                                right: 0,
                                child: Image.asset(
                                  "assets/images/cough.png",
                                  fit: BoxFit.none,
                                ),
                              ),
                              Positioned(
                                left: 0,
                                right: 0,
                                bottom: 0,
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.width * .32,
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryBackground,
                                    border: Border.fromBorderSide(
                                        Borders.primaryBorder),
                                    borderRadius: Radii.k30pxRadius,
                                  ),
                                  child: Container(),
                                ),
                              ),
                              Positioned(
                                left: 20,
                                top: MediaQuery.of(context).size.width * .36,
                                child: Text(
                                  "Dry Cough",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 30, 30, 30),
                                    fontFamily: "League Spartan",
                                    fontWeight: FontWeight.w700,
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            .03,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 20,
                                bottom:
                                    MediaQuery.of(context).size.height * .025,
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * .38,
                                  child: Text(
                                    "A dry cough is a cough that doesn't bring up mucus.",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 85, 75, 134),
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w400,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              .028,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 20,
                                bottom: 11,
                                child: Container(
                                  width: MediaQuery.of(context).size.width * .3,
                                  height: 2,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 114, 215, 255),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(2)),
                                  ),
                                  child: Container(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * .45,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(200, 210, 250, 2255),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              boxShadow: [Shadows.primaryShadow]),
                          child: Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              Positioned(
                                left: 0,
                                bottom:
                                    MediaQuery.of(context).size.width * .005,
                                right: 0,
                                child: Image.asset(
                                  "assets/images/sore_throat.png",
                                  fit: BoxFit.none,
                                ),
                              ),
                              Positioned(
                                left: 0,
                                right: 0,
                                bottom: 0,
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.width * .32,
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryBackground,
                                    border: Border.fromBorderSide(
                                        Borders.primaryBorder),
                                    borderRadius: Radii.k30pxRadius,
                                  ),
                                  child: Container(),
                                ),
                              ),
                              Positioned(
                                left: 15,
                                top: MediaQuery.of(context).size.width * .36,
                                child: Text(
                                  "Sore Throat",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 30, 30, 30),
                                    fontFamily: "League Spartan",
                                    fontWeight: FontWeight.w700,
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            .03,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 20,
                                bottom:
                                    MediaQuery.of(context).size.height * .025,
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * .38,
                                  child: Text(
                                    "Throat pains are dry, or scratchy feeling in the throat.",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 85, 75, 134),
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w400,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              .028,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 20,
                                bottom: 11,
                                child: Container(
                                  width: MediaQuery.of(context).size.width * .3,
                                  height: 2,
                                  decoration: BoxDecoration(
                                    color: Colors.orangeAccent,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(2)),
                                  ),
                                  child: Container(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.width * .65,
                    margin: EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * .45,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 221, 224, 255),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              boxShadow: [Shadows.primaryShadow]),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Positioned(
                                left: 0,
                                bottom: MediaQuery.of(context).size.width * .04,
                                right: 0,
                                child: Image.asset(
                                  "assets/images/cold.png",
                                  fit: BoxFit.none,
                                ),
                              ),
                              Positioned(
                                left: 0,
                                right: 0,
                                bottom: 0,
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.width * .32,
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryBackground,
                                    border: Border.fromBorderSide(
                                        Borders.primaryBorder),
                                    borderRadius: Radii.k30pxRadius,
                                  ),
                                  child: Container(),
                                ),
                              ),
                              Positioned(
                                left: 20,
                                top: MediaQuery.of(context).size.width * .36,
                                child: Text(
                                  "Breathing",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 30, 30, 30),
                                    fontFamily: "League Spartan",
                                    fontWeight: FontWeight.w700,
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            .03,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 20,
                                bottom:
                                    MediaQuery.of(context).size.height * .025,
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * .38,
                                  child: Text(
                                    "Shortness of breath or difficulty breathing.",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 85, 75, 134),
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w400,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              .028,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 20,
                                bottom: 11,
                                child: Container(
                                  width: MediaQuery.of(context).size.width * .3,
                                  height: 2,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 114, 215, 255),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(2)),
                                  ),
                                  child: Container(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * .45,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(200, 237, 255, 226),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              boxShadow: [Shadows.primaryShadow]),
                          child: Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              Positioned(
                                left: 0,
                                bottom: MediaQuery.of(context).size.width * .03,
                                right: 0,
                                child: Image.asset(
                                  "assets/images/tired.png",
                                  fit: BoxFit.none,
                                ),
                              ),
                              Positioned(
                                left: 0,
                                right: 0,
                                bottom: 0,
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.width * .32,
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryBackground,
                                    border: Border.fromBorderSide(
                                        Borders.primaryBorder),
                                    borderRadius: Radii.k30pxRadius,
                                  ),
                                  child: Container(),
                                ),
                              ),
                              Positioned(
                                left: 20,
                                top: MediaQuery.of(context).size.width * .36,
                                child: Text(
                                  "Tiredness",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 30, 30, 30),
                                    fontFamily: "League Spartan",
                                    fontWeight: FontWeight.w700,
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            .03,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 20,
                                bottom:
                                    MediaQuery.of(context).size.height * .025,
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * .38,
                                  child: Text(
                                    "Constantly feeling drained and tired.",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 85, 75, 134),
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w400,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              .028,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 20,
                                bottom: 11,
                                child: Container(
                                  width: MediaQuery.of(context).size.width * .3,
                                  height: 2,
                                  decoration: BoxDecoration(
                                    color: Colors.orangeAccent,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(2)),
                                  ),
                                  child: Container(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
