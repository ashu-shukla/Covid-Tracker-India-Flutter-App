import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

class InterError extends StatefulWidget {
  @override
  _InterErrorState createState() => _InterErrorState();
}

class _InterErrorState extends State<InterError> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                child: const Text(
                  'Seems like you\'re not connected to the internet!\n Please connect and click on retry.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      color: Colors.black38),
                ),
              ),
              FlatButton(
                color: Color.fromARGB(255, 85, 75, 134),
                textColor: Colors.white,
                child: const Text(
                  'Retry',
                  style: TextStyle(fontFamily: 'Poppins'),
                ),

                /// 2. Call Phoenix.rebirth(context) to rebuild your app
                onPressed: () => Phoenix.rebirth(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
