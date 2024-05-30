import 'package:flutter/material.dart';

class NaviagtionHelper {
  static void goTo(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }

  static void goOff(BuildContext context, Widget screen) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => screen));
  }

  static void goOffAll(BuildContext context, Widget screen) {
    Navigator.pushAndRemoveUntil(
        context, MaterialPageRoute(builder: (context) => screen), (route) => false);
  }
}
