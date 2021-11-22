import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'models/screendisplay.dart';
import 'package:provider/provider.dart';
import 'dart:developer';
import 'package:flutter/services.dart';

class Calc extends StatelessWidget {
  String screen = screenstatus().getscreen();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return Stack(children: [
      Container(
          height: MediaQuery.of(context).size.height, color: Colors.black),
      Column(children: [
        Screen(),
        SizedBox(height: 10),
        Keypad(),
      ]),
    ]);
  }
}

class Screen extends StatefulWidget {
  String screen = screenstatus().getscreen();

  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  @override
  Widget build(BuildContext context) {
    screenstatus s = Provider.of<screenstatus>(context);
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade800,
      ),
      height: 250,
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.grey.shade800,
              borderRadius: BorderRadius.circular(10)),
          margin: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.centerRight,
          child: Text(
            s.getscreen(),
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 50, color: Colors.white),
          ),
        ),
      ),
      // ),
    );
  }
}

class Keypad extends StatelessWidget {
  String screen = screenstatus().getscreen();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        // mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Container(
                color: Colors.black,
                // height: MediaQuery.of(context).size.height - 220,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(children: [
                        Keyboard_Button("1"),
                        SizedBox(height: 5),
                        Keyboard_Button("4"),
                        SizedBox(height: 5),
                        Keyboard_Button("7"),
                        SizedBox(height: 5),
                        Keyboard_Button("0"),
                        SizedBox(height: 5),
                        Keyboard_Button("+")
                      ]),
                    ),
                    Expanded(
                      child: Column(children: [
                        Keyboard_Button("2"),
                        SizedBox(height: 5),
                        Keyboard_Button("5"),
                        SizedBox(height: 5),
                        Keyboard_Button("8"),
                        SizedBox(height: 5),
                        Keyboard_Button("("),
                        SizedBox(height: 5),
                        Keyboard_Button("-"),
                      ]),
                    ),
                    Expanded(
                      child: Column(children: [
                        Keyboard_Button("3"),
                        SizedBox(height: 5),
                        Keyboard_Button("6"),
                        SizedBox(height: 5),
                        Keyboard_Button("9"),
                        SizedBox(height: 5),
                        Keyboard_Button(")"),
                        SizedBox(height: 5),
                        Keyboard_Button("*"),
                      ]),
                    ),
                    Expanded(
                      child: Column(children: [
                        Keyboard_Button("=", f: 2),
                        SizedBox(height: 5),
                        Keyboard_Button("%"),
                        SizedBox(height: 5),
                        Keyboard_Button("^"),
                        SizedBox(height: 5),
                        Keyboard_Button("/"),
                      ]),
                    ),
                  ],
                )),
          ),
          Row(
            children: [Keyboard_Button("AC"), Keyboard_Button("DEL")],
          )
        ],
      ),
    );
  }
}

//TODO::AUTO SCROLL TO BOTTOM
class Keyboard_Button extends StatelessWidget {
  String s;
  int f;
  Keyboard_Button(this.s, {this.f = 1});
  @override
  Widget build(BuildContext context) {
    screenstatus s1 = Provider.of<screenstatus>(context);
    String screen = s1.getscreen();
    return Expanded(
      flex: f,
      child: OutlinedButton(
        onPressed: () {
          if (s == "AC") {
            log("ac pressed");
            s1.clearscreen();
          } else if (s == "=") {
            s1.outputresult(screen);
          } else if (s == "DEL") {
            s1.setscreen(screen.substring(0, screen.length - 1));
          } else {
            screen == "AC" ? screen = s : screen += s;
            s1.setscreen(screen);
          }
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.grey.shade500, width: 4)),
          child: Center(
            child: Text(s,
                style: TextStyle(
                    // height: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
        ),
      ),
    );
    // child: Text(
    //   s,
    //   style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
    // ));
  }
}
