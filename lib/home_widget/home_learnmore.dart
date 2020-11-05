import 'package:covid_tracker/symptoms_widget/symptoms_widget.dart';
import 'package:flutter/material.dart';

class Learnmore extends StatefulWidget {
  @override
  _LearnmoreState createState() => _LearnmoreState();
}

class _LearnmoreState extends State<Learnmore> {
  void onLPressed(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (context) => SymptomsWidget()));

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .9,
      height: MediaQuery.of(context).size.height * .09,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(right: 5),
            child: Text(
              "Know the symptoms of Covid-19",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromARGB(255, 109, 114, 120),
                fontWeight: FontWeight.w400,
                fontSize: MediaQuery.of(context).size.height * .017,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * .25,
            height: MediaQuery.of(context).size.height * .04,
            margin: EdgeInsets.only(right: 1, top: 3),
            child: FlatButton(
              onPressed: () => this.onLPressed(context),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              textColor: Color.fromARGB(255, 246, 95, 156),
              padding: EdgeInsets.all(0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Learn More",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromARGB(255, 246, 95, 156),
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                      fontSize: MediaQuery.of(context).size.height * .017,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .007,
                  ),
                  Image.asset(
                    "assets/images/path.png",
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
