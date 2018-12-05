import 'package:flutter/material.dart';

class BMI extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BMIState();
  }
}

class BMIState extends State<BMI> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('BMI'),
          backgroundColor: Colors.pinkAccent,
        ),
      ),
    );
  }
}
