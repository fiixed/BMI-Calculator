import 'package:flutter/material.dart';

class BMI extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BMIState();
  }
}

class BMIState extends State<BMI> {
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  double _inches = 0.0;
  double _result = 0.0;

  String _levelOfFatness = '';

  void _calculate() {
    setState(() {
      int age = int.parse(_ageController.text);
      double height = double.parse(_heightController.text);
      _inches = height * 12;
      double weight = double.parse(_weightController.text);

      if ((_ageController.text.isNotEmpty || age > 0) &&
          ((_heightController.text.isNotEmpty || _inches > 0) &&
              (_weightController.text.isNotEmpty || weight > 0))) {
        _result = weight / (_inches * _inches) * 703;

        if (double.parse(_result.toStringAsFixed(1)) < 18.5) {
          _levelOfFatness = 'Underweight';
        } else if (double.parse(_result.toStringAsFixed(1)) >= 18.5 &&
            _result < 25) {
          _levelOfFatness = 'Great Shape!';
        } else if (double.parse(_result.toStringAsFixed(1)) >= 25.0 &&
            _result < 30) {
          _levelOfFatness = 'Overweight';
        } else if (double.parse(_result.toStringAsFixed(1)) >= 30.0) {
          _levelOfFatness = 'Overweight';
        }
      } else {
        _result = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: new AppBar(
          title: new Text('BMI'),
          centerTitle: true,
          backgroundColor: Colors.pinkAccent,
        ),
        body: Container(
          alignment: Alignment.topCenter,
          child: ListView(
            padding: const EdgeInsets.all(2.0),
            children: <Widget>[
              new Image.asset(
                'images/bmilogo.png',
                height: 85.0,
                width: 75.0,
              ),
              new Container(
                margin: const EdgeInsets.all(3.0),
                height: 247.0,
                width: 290.0,
                color: Colors.grey.shade300,
                child: new Column(
                  children: <Widget>[
                    new TextField(
                      controller: _ageController,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                          labelText: 'Age',
                          hintText: 'e.g: 34',
                          icon: new Icon(Icons.person_outline)),
                    ),

                    new TextField(
                        controller: _heightController,
                        keyboardType: TextInputType.number,
                        decoration: new InputDecoration(
                            labelText: 'Height in feet',
                            hintText: 'e.g 6.5',
                            icon: new Icon(Icons.insert_chart))),
                    new TextField(
                        controller: _weightController,
                        keyboardType: TextInputType.number,
                        decoration: new InputDecoration(
                            labelText: 'Weight in lbs',
                            hintText: 'e.g 180',
                            icon: new Icon(Icons.line_weight))),

                    new Padding(padding: new EdgeInsets.all(10.6)),

                    //calculate button
                    new Container(
                      alignment: Alignment.center,
                      child: new RaisedButton(
                        onPressed: _calculate,
                        color: Colors.pinkAccent,
                        child: new Text('Calculate'),
                        textColor: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text(
                    "Your BMI: ${_result.toStringAsFixed(2)}",
                    style: new TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                        fontSize: 19.9),
                  ),
                  new Padding(padding: const EdgeInsets.all(5.0)),
                  new Text(
                    "$_levelOfFatness ",
                    style: new TextStyle(
                        color: Colors.pinkAccent,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                        fontSize: 19.9),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
