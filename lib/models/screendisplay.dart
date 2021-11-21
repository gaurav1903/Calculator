import 'package:flutter/material.dart';
import 'dart:collection';
import 'dart:math';
import 'stack.dart' as st;

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
    String ans = calc(s).toString();
    screen = ans;
    notifyListeners();
  }

  String reverse(String s) {
    String ans = "";
    for (int i = s.length - 1; i >= 0; i--) ans += s[i];
    return ans;
  }

  String calc(String s) {
    List l = ['+', '-', '*', '/', '%', '^'];
    final stk = st.Stack<String>();
    int r = 0;
    for (int i = 0; i < s.length; i++) {
      int x = s.codeUnitAt(i) - 48;
      if (x >= 0 && x <= 9) {
        if (r == 0) {
          r = x;
        } else
          r = r * 10 + x;
      }
      if (l.contains(s[i])) {
        stk.push(r.toString());
        r = 0;
        stk.push(s[i]);
      } else if (s[i] == '(') {
        if (r != 0) {
          stk.push(r.toString());
          r = 0;
        }
        stk.push('(');
      } else //           ')'
      {
        if (r != 0) {
          stk.push(r.toString());
          r = 0;
        }
        String t = stk.pop();
        String temp = "";
        while (t != '(') {
          temp += t;
          t = stk.pop();
        }
        //
        stk.push(calc(reverse(temp)));
      }
    }
    Queue q = stk.getqueue();
    //TODO::Handle negatives
    Queue q2 = Queue();
    double t = double.parse(q.removeFirst());
    while (q.isNotEmpty) {
      var x = q.removeFirst();
      if (x == '+' || x == '-') {
        q2.addLast(t.toString());
        t = q.removeFirst();
        q2.addLast(x);
      } else {
        var y = double.parse(q.removeFirst());
        if (x == '*') {
          t = t * y;
        } else if (x == '/') {
          t = t / y;
        } else if (x == '%')
          t = t % y;
        else
          t = pow(t, y);
      }
    }
    if (t != 0) q2.addLast(t);
    //noow we have handled priority 1 operators now only + or -
    double ans = double.parse(q2.removeFirst());
    while (q2.isNotEmpty) {
      var y = q2.removeFirst();
      double z = double.parse(q2.removeFirst());
      if (y == '+') {
        ans += z;
      } else {
        ans -= z;
      }
    }
    return ans.toString();
    //FIRST DRAFT COMPLETE
  }
}
