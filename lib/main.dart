import 'package:flutter/material.dart';
import 'dart:math';
import 'package:shake/shake.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.blue,
          appBar: AppBar(
            title: Text('Ask Me Anything'),
            backgroundColor: Colors.blueGrey[900],
          ),
          body: Magic8Ball(),
        ),
      ),
    );

class Magic8Ball extends StatefulWidget {
  @override
  _Magic8BallState createState() => _Magic8BallState();
}

class _Magic8BallState extends State<Magic8Ball> {
  int ballNumber = 3;

  void changeBallNumber() {
    setState(() {
      ballNumber = Random().nextInt(5) + 1;
    });
  }

  void initState() {
    super.initState();
    ShakeDetector detector = ShakeDetector.autoStart(onPhoneShake: () {
      changeBallNumber();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(children: <Widget>[
        Expanded(
          child: FlatButton(
              onPressed: () {
                this.changeBallNumber();
              },
              child: Image.asset('images/ball$ballNumber.png')),
        ),
      ]),
    );
  }
}
