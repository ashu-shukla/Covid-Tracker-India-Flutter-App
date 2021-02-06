import 'package:covid_tracker/about_widget/about_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:intl/intl.dart';

import 'home_widget_animation1.dart';

class HomeNav extends StatefulWidget {
  HomeNav({List<dynamic> dat}) : this.dat = dat ?? [];
  final List<dynamic> dat;

  @override
  _HomeNavState createState() => _HomeNavState();
}

class _HomeNavState extends State<HomeNav> with SingleTickerProviderStateMixin {
  AnimationController navButtonAnimationController;

  @override
  void initState() {
    super.initState();
    this.navButtonAnimationController =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    this.navButtonAnimationController.dispose();
  }

  void onNavPressed(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AboutWidget()));
    startAnimationOne();
  }

  void startAnimationOne() => this.navButtonAnimationController.forward();
  @override
  Widget build(BuildContext context) {
    var time;
    widget.dat.forEach((element) {
      if (element.statecode == 'TT') {
        time = element.lastupdatedtime;
      }
    });
    var t = time.split('/');
    var tim = t[2].split(' ');
    if(int.parse(t[1])>=1 && int.parse(t[1])<10){
      t[1] = '0${t[1]}';
    }
    if(int.parse(t[0])>=1 && int.parse(t[0])<10){
      t[0] = '0${t[0]}';
    }
    String tip = '${tim[0]}-${t[1]}-${t[0]} ${tim[1]}';
    final DateTime now = DateTime.parse(tip);
    final DateFormat formatter = DateFormat('dd MMM, ').add_jm();
    final String formatted = formatter.format(now);
    return Container(
      width: MediaQuery.of(context).size.width * .95,
      height: MediaQuery.of(context).size.height * .2,
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * .05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * .009),
            child: Text(
              "Last updated: $formatted",
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color.fromARGB(255, 85, 75, 134),
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
                fontSize: MediaQuery.of(context).size.height * .02,
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * .16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Text(
                        "Covid-19",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color.fromARGB(255, 30, 30, 30),
                          fontFamily: "League Spartan",
                          fontWeight: FontWeight.w700,
                          fontSize: MediaQuery.of(context).size.height * .06,
                        ),
                      ),
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 8),
                            child: Text(
                              "India",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Color.fromARGB(255, 30, 30, 30),
                                fontFamily: "League Spartan",
                                fontWeight: FontWeight.w700,
                                fontSize:
                                    MediaQuery.of(context).size.height * .04,
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * .23,
                            margin: EdgeInsets.only(left: 5, bottom: 6),
                            // height: MediaQuery.of(context).size.width * .0,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 223, 10, 86),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(9.5))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 1, right: 1),
                                  child: Text(
                                    "Live",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w400,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              .03,
                                    ),
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
              Spacer(),
              Container(
                height: MediaQuery.of(context).size.height * .14,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * .1,
                      margin: EdgeInsets.only(right: 2),
                      child: HomeWidgetAnimation1(
                        animationController: this.navButtonAnimationController,
                        child: SizedBox(
                          child: FlatButton(
                            onPressed: () => this.onNavPressed(context),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                            ),
                            padding: EdgeInsets.all(0),
                            child: Wrap(
                              children: [
                                Image.asset(
                                  "assets/images/nav.png",
                                  fit: BoxFit.fill,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .23,
                      // margin: EdgeInsets.only(bottom: 0),
                      child: FittedBox(
                        child: FloatingActionButton.extended(
                            icon: Icon(Icons.refresh),
                            backgroundColor: Color.fromARGB(255, 85, 75, 134),
                            elevation: 10,
                            label: Text('Refresh'),
                            onPressed: () => Phoenix.rebirth(context)),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
