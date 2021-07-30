/*
*  shadows.dart
*  Covid Tracker
*
*  Created by Ashutosh Shukla.
*  Copyright © 2018 [Company]. All rights reserved.
    */

import 'package:flutter/rendering.dart';

class Shadows {
  static const BoxShadow primaryShadow = BoxShadow(
    color: Color.fromARGB(255, 220, 221, 248),
    offset: Offset(4, 6),
    blurRadius: 20,
  );
  static const BoxShadow secondaryShadow = BoxShadow(
    color: Color.fromARGB(255, 239, 239, 247),
    offset: Offset(0, 6),
    blurRadius: 26,
  );
}
