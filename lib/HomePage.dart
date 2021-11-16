import 'package:flutter/material.dart';
import 'package:calculator/Calc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Gaurav Scientific Calculator')),
        body: Calc());
  }
}
