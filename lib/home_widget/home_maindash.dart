import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MainDash extends StatefulWidget {
  MainDash({List<dynamic> data}) : this.data = data ?? [];
  final List<dynamic> data;
  @override
  _MainDashState createState() => _MainDashState();
}

class _MainDashState extends State<MainDash> {
  @override
  Widget build(BuildContext context) {
    var time;
    widget.data.forEach((element) {
      if (element.statecode == 'TT') {
        time = element;
      }
    });
    var con = double.parse(time.confirmed);
    var det = double.parse(time.deaths);
    var act = double.parse(time.active);
    var rec = double.parse(time.recovered);
    final formatter = NumberFormat('##,##,###');
    final String confirmed = formatter.format(con);
    final String deaths = formatter.format(det);
    final String active = formatter.format(act);
    final String recovered = formatter.format(rec);
    return Container(
      width: MediaQuery.of(context).size.width * .95,
      height: MediaQuery.of(context).size.height * .31,
      margin: EdgeInsets.only(top: 22),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              width: MediaQuery.of(context).size.width * .46,
              height: MediaQuery.of(context).size.height * .5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: MediaQuery.of(context).size.width * .45,
                      height: MediaQuery.of(context).size.height * .15,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 235, 241),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(105, 221, 221, 240),
                            offset: Offset(0, 9),
                            blurRadius: 34,
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              width: MediaQuery.of(context).size.width * .42,
                              height: MediaQuery.of(context).size.height * .2,
                              margin: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * .02,
                                top: MediaQuery.of(context).size.height * .005,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                      width: 18,
                                      height: 19,
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Positioned(
                                            top: 0,
                                            right: 0,
                                            child: Opacity(
                                              opacity: 0.20743,
                                              child: Container(
                                                width: 18,
                                                height: 19,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    width: 4,
                                                    color: Color.fromARGB(
                                                        255, 253, 78, 113),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(8.5)),
                                                ),
                                                child: Container(),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            top: 4,
                                            right: 4,
                                            child: Container(
                                              width: 10,
                                              height: 11,
                                              decoration: BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 253, 78, 113),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(4.5)),
                                              ),
                                              child: Container(),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "Confirmed",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 75, 66, 121),
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w600,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                .02,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      margin: EdgeInsets.only(top: 1),
                                      child: Text(
                                        "$confirmed",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 223, 10, 86),
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.w400,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .025,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .17),
                                      width: MediaQuery.of(context).size.width *
                                          .16,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .03,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            child: Text(
                                              time.deltaconfirmed,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 129, 124, 155),
                                                fontFamily: "Poppins",
                                                fontWeight: FontWeight.w400,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    .02,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 7,
                                            height: 5,
                                            margin: EdgeInsets.only(
                                                top: 5, left: 2),
                                            child: Image.asset(
                                              "assets/images/triangle-3.png",
                                              fit: BoxFit.none,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: MediaQuery.of(context).size.width * .45,
                      height: MediaQuery.of(context).size.height * .15,
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * .01),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 238, 236, 249),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * .42,
                            height: MediaQuery.of(context).size.height * .2,
                            margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * .02,
                              top: MediaQuery.of(context).size.height * .005,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    width: 18,
                                    height: 19,
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Positioned(
                                          top: 4,
                                          right: 4,
                                          child: Container(
                                            width: 10,
                                            height: 11,
                                            decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 87, 75, 144),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(4.5)),
                                            ),
                                            child: Container(),
                                          ),
                                        ),
                                        Positioned(
                                          top: 0,
                                          right: 0,
                                          child: Opacity(
                                            opacity: 0.20743,
                                            child: Container(
                                              width: 18,
                                              height: 19,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  width: 4,
                                                  color: Color.fromARGB(
                                                      255, 148, 117, 255),
                                                ),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8.5)),
                                              ),
                                              child: Container(),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Deceased",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 85, 75, 134),
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w600,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              .02,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    margin: EdgeInsets.only(top: 2),
                                    child: Text(
                                      "$deaths",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 85, 75, 134),
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w400,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                .025,
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width *
                                                .25),
                                    width:
                                        MediaQuery.of(context).size.width * .13,
                                    height: MediaQuery.of(context).size.height *
                                        .03,
                                    child: Row(
                                      children: <Widget>[
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: Container(
                                            margin: EdgeInsets.only(right: 3),
                                            child: Text(
                                              time.deltadeaths,
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 129, 124, 155),
                                                fontFamily: "Poppins",
                                                fontWeight: FontWeight.w400,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    .02,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: Container(
                                            width: 7,
                                            height: 5,
                                            margin: EdgeInsets.only(top: 4),
                                            child: Image.asset(
                                              "assets/images/triangle.png",
                                              fit: BoxFit.none,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.48,
              height: MediaQuery.of(context).size.height * .5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: MediaQuery.of(context).size.width * .5,
                      height: MediaQuery.of(context).size.height * .2,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 230, 255, 248),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * .45,
                            margin: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * .02,
                                top: MediaQuery.of(context).size.height * .005),
                            child: Stack(
                              alignment: Alignment.topLeft,
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    width: 18,
                                    height: 19,
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Positioned(
                                          top: 0,
                                          right: 0,
                                          child: Opacity(
                                            opacity: 0.20743,
                                            child: Container(
                                              width: 18,
                                              height: 19,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  width: 4,
                                                  color: Color.fromARGB(
                                                      255, 109, 212, 0),
                                                ),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8.5)),
                                              ),
                                              child: Container(),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 4,
                                          right: 4,
                                          child: Container(
                                            width: 10,
                                            height: 11,
                                            decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 109, 212, 0),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(4.5)),
                                            ),
                                            child: Container(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 0,
                                  top: MediaQuery.of(context).size.height * .07,
                                  child: Text(
                                    "Recovered",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 96, 85, 148),
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w600,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              .02,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 0,
                                  bottom:
                                      MediaQuery.of(context).size.height * .04,
                                  child: Text(
                                    "$recovered",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 38, 162, 107),
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w400,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              .025,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom:
                                      MediaQuery.of(context).size.height * .01,
                                  right:
                                      MediaQuery.of(context).size.height * .019,
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          .15,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .03,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Align(
                                            alignment: Alignment.bottomLeft,
                                            child: Container(
                                              child: Text(
                                                time.deltarecovered,
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 129, 124, 155),
                                                  fontFamily: "Poppins",
                                                  fontWeight: FontWeight.w400,
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          .02,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.bottomLeft,
                                            child: Container(
                                              width: 7,
                                              height: 5,
                                              margin: EdgeInsets.only(
                                                  bottom: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      .016),
                                              child: Image.asset(
                                                "assets/images/triangle-2.png",
                                                fit: BoxFit.none,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: MediaQuery.of(context).size.width * .5,
                      height: MediaQuery.of(context).size.height * .1,
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * .01),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 231, 247, 255),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * .45,
                            height: MediaQuery.of(context).size.height * .4,
                            margin: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * .02,
                                top: MediaQuery.of(context).size.height * .005),
                            child: Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  child: Text(
                                    "Active",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 85, 75, 134),
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w600,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              .02,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 0,
                                  top: MediaQuery.of(context).size.height * .04,
                                  child: Text(
                                    "$active",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 0, 150, 202),
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w400,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              .025,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: Opacity(
                                    opacity: 0.20743,
                                    child: Container(
                                      width: 18,
                                      height: 19,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 4,
                                          color:
                                              Color.fromARGB(255, 0, 183, 255),
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8.5)),
                                      ),
                                      child: Container(),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 4,
                                  right: 4,
                                  child: Container(
                                    width: 10,
                                    height: 11,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 117, 199, 229),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(4.5)),
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
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
