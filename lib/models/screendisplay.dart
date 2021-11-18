import 'package:flutter/material.dart';

class screenstatus with ChangeNotifier {
  static String screen = "AC";
  String getscreen() {
    return screen;
  }

  void setscreen(String s) {
    screen = s;
    notifyListeners();
  }

  void clearscreen() {
    setscreen("AC");
  }

  void outputresult(String s) {
    ///TODO:LOGIC FOR COMPUTING CALC
    String ans = null;
    screen = ans;
    notifyListeners();
  }
}
