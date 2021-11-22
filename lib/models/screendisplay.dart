import 'package:flutter/material.dart';
import 'dart:collection';
import 'dart:math' as math;
import 'stack.dart' as st;
import 'package:tuple/tuple.dart';
import 'dart:developer';

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
    String ans = calc(s);
    screen = ans;
    notifyListeners();
  }

  String reverse(String s) {
    String ans = "";
    for (int i = s.length - 1; i >= 0; i--) ans += s[i];
    return ans;
  }

  String postfixeval(Queue q) {
    var s = st.Stack();
    while (q.isNotEmpty) {
      var z = q.removeFirst();
      if (['+', '-', '*', '/', '%', '^'].contains(z)) {
        if (s.size < 2) return "INVALID";
        var b = s.pop();
        var a = s.pop();
        if (z == '+')
          s.push(a + b);
        else if (z == '-')
          s.push(a - b);
        else if (z == '*')
          s.push(a * b);
        else if (z == '/')
          s.push(a / b);
        else if (z == '%')
          s.push(a % b);
        else
          s.push(math.pow(a, b));
      } else {
        s.push(double.parse(z));
      }
    }
    return s.pop().toString();
  }

  String calc(String s) {
    //easier method is to convert expr to postfix(it removes brackets too) to handle neggatives be careful and then evaluate
    Queue q = postfix(s);
    if (q.isEmpty) return "INVALID";
    log(q.toList().toString());
    return postfixeval(q);
    //FIRST DRAFT COMPLETE
  }

  bool compare(
      String s, String t) //true for DONT POP if s on top and t has arrived
  {
    if (s == t) {
      return false;
    }
    List l3 = ['+', '-'];
    List l1 = ['^'];
    List l2 = ['*', '/', '%'];
    if (l1.contains(t) || s == '(')
      return true;
    else if (l2.contains(t)) {
      if (l1.contains(s) || l2.contains(s))
        return false;
      else
        return true;
    } else
      return false;
  }

  Queue postfix(String s) {
    var stk = st.Stack();
    int op = 0;
    var q = Queue();
    int i = 0;
    //if 2 operators together then second must be - or it is invalid in case it is - then take the next operand(must be)  appended with -
    while (i < s.length) {
      log(i.toString() + " $op index");
      var x = s[i];
      int a = s.codeUnitAt(i) - 48;
      log("check here");
      if (a >= 0 && a <= 9) {
        if (op == 0) {
          //
          // log("check point 101");
          if (q.isNotEmpty) {
            var w = q.removeLast();
            // log(w + " check p 2");
            var v = double.parse(w);
            int code = 1;
            if (v < 0) code = -1;
            // log(v.toString());
            x = (v * 10 + double.parse(x) * code).toString();
          }
        }
        q.addLast(x);
        op = 0;
      } else {
        if (op == 1 && x != '(') {
          log("point 1");
          if (s[i] != '-')
            return Queue();
          else {
            op = 0;
            log("ran " + i.toString());
            if (s.codeUnitAt(i + 1) - 48 >= 0 && s.codeUnitAt(i + 1) - 48 <= 9)
              q.addLast('-' + s[i + 1]);
            else {
              return Queue();
            }
            i++;
          }
        }
        //operator
        else if (x == '(') {
          stk.push(x);
          op = 1;
        } else if (x == ')') {
          op = 1;
          var z = stk.top();
          while (z != '(') {
            //TODO::OVERFLOW
            q.addLast(stk.pop());
            if (q.isEmpty) {
              return Queue();
            }
            z = stk.top();
          }
          stk.pop();
        } else {
          //*,/,%,^
          op = 1;
          while (!stk.isEmpty && compare(stk.top(), x) == false) {
            var z = stk.pop();
            q.addLast(z);
          }
          stk.push(x);
        }
      }
      i++;
    }
    while (!stk.isEmpty) q.addLast(stk.pop());
    return q;
  }
}
