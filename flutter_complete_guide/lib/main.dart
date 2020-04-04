import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _qIndex = 0;

  void _response() {
    setState(() {
      _qIndex++;
    });
    print(_qIndex);
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'questionText': 'What\'s your favorite color?', 
        'answers': ['Green', 'Red', 'Blue', 'White']
      },
      {
        'questionText': 'What\'s your favorite animal?', 
        'answers': ['Dog', 'Cat', 'Elephant', 'Panda']
      },
      {
        'questionText': 'Who\'s your favorite instructor?', 
        'answers': ['Max', 'Stephen', 'Max', 'Max']
      }
    ]
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Column(
          children: [
            Question(
              questions[_qIndex],
            ),
            Answer(_response),
            Answer(_response),
            Answer(_response),
          ],
        ),
      ),
    );
  }
}
