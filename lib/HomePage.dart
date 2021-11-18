import 'package:flutter/material.dart';
import 'package:calculator/Calc.dart';
import 'package:provider/provider.dart';
import 'models/screendisplay.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => screenstatus(),
      child: Scaffold(
          appBar: AppBar(title: Text('Gaurav Scientific Calculator')),
          body: Calc()),
    );
  }
}
