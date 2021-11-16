import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Calc extends StatelessWidget {
  String s = '0';
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Screen(s),
      SizedBox(height: 10),
      Keypad(),
    ]);
  }
}

class Screen extends StatefulWidget {
  String s;
  Screen(this.s);

  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            height: 110,
            width: MediaQuery.of(context).size.width,
            color: Colors.black),
        Container(
          padding: EdgeInsets.all(10),
          height: 90,
          decoration: BoxDecoration(
              color: Colors.grey.shade800,
              borderRadius: BorderRadius.circular(10)),
          margin: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.centerRight,
          child: Text(
            widget.s,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 50, color: Colors.white),
          ),
        ),
      ],
    );
  }
}

class Keypad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: GridView.count(
        children: [
          Text('a'),
          Text('b'),
          Text('c'),
          Text('d'),
          Text('e'),
        ],
        crossAxisCount: 4,
      ),
    );
  }
}
