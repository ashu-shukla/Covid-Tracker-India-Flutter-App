/*
*  about_widget.dart
*  Covid Tracker
*
*  Created by Ashutosh Shukla.
*  Copyright © 2018 [Company]. All rights reserved.
    */

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class AboutWidget extends StatelessWidget {
  void onViewPressed(BuildContext context) => Navigator.pop(context);

  _launchURL() async {
    const url = 'https://covid19-india-track.herokuapp.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _fbURL() async {
    const url = 'https://www.facebook.com/ashutoshshukla8/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _igURL() async {
    const url = 'https://www.instagram.com/ashutoshshukla__/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _tweetURL() async {
    const url = 'https://twitter.com/ashu_shukla_';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _linkdURL() async {
    const url = 'https://www.linkedin.com/in/ashutosh-shukla-72a00b196/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height - 130;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 43,
            height: 33,
            margin: EdgeInsets.only(left: 20, top: 33, right: 0),
            child: FlatButton(
              onPressed: () => this.onViewPressed(context),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              textColor: Color.fromARGB(255, 0, 0, 0),
              padding: EdgeInsets.only(right: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/images/path-1.png",
                  ),
                  SizedBox(
                    width: 8,
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 251,
            margin: EdgeInsets.only(left: 20, top: 7),
            child: Text(
              "About",
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color.fromARGB(255, 30, 30, 30),
                fontFamily: "League Spartan",
                fontWeight: FontWeight.w700,
                fontSize: 40,
              ),
            ),
          ),
          Container(
            height: height,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: 186,
                    height: 186,
                    margin: EdgeInsets.only(top: 41),
                    child: Image.asset(
                      "assets/images/profile.png",
                      fit: BoxFit.none,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 22),
                  child: Text(
                    "Ashutosh Shukla",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromARGB(255, 30, 30, 30),
                      fontFamily: "League Spartan",
                      fontWeight: FontWeight.w700,
                      fontSize: 25,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: 315,
                    margin: EdgeInsets.only(top: 21),
                    child: Text(
                      "I believe that information given at the right time to some one is the most valuable service that I could possibly provide amidst the pandemic.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromARGB(255, 30, 30, 30),
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: 315,
                    margin: EdgeInsets.only(top: 31),
                    child: Text(
                      "The app is derived from the website I coded to give you in-app details rather than loading the website frequently.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromARGB(255, 30, 30, 30),
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Center(
                    child: RawMaterialButton(
                      onPressed: _launchURL,
                      fillColor: Color.fromARGB(255, 85, 75, 134),
                      padding: EdgeInsets.only(left: 10, right: 10),
                      shape: StadiumBorder(),
                      elevation: 0,
                      child: Text(
                        "Covid Tracker",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 22),
                  child: Text(
                    "Connect with me",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromARGB(255, 30, 30, 30),
                      fontFamily: "League Spartan",
                      fontWeight: FontWeight.w700,
                      fontSize: 25,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .8,
                  margin: EdgeInsets.only(bottom: 22),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Center(
                        child: IconButton(
                            onPressed: _linkdURL,
                            color: Color.fromARGB(255, 210, 200, 250),
                            iconSize: 40,
                            icon: Icon(LineAwesomeIcons.linkedin)),
                      ),
                      Center(
                        child: IconButton(
                            onPressed: _igURL,
                            color: Color.fromARGB(255, 255, 200, 241),
                            iconSize: 40,
                            icon: Icon(LineAwesomeIcons.instagram)),
                      ),
                      Center(
                        child: IconButton(
                            onPressed: _tweetURL,
                            color: Color.fromARGB(255, 150, 200, 255),
                            iconSize: 40,
                            icon: Icon(LineAwesomeIcons.twitter)),
                      ),
                      Center(
                        child: IconButton(
                            onPressed: _fbURL,
                            color: Color.fromARGB(255, 200, 230, 249),
                            iconSize: 40,
                            icon: Icon(LineAwesomeIcons.facebook)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    //     ],
    //   ),
    // );
  }
}
