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
  final questions = const [
    {
      'questionText': 'What\'s your favorite color?', 
      'answers': ['Green', 'Red', 'Blue', 'White'],
    },
    {
      'questionText': 'What\'s your favorite animal?', 
      'answers': ['Dog', 'Cat', 'Elephant', 'Panda'],
    },
    {
      'questionText': 'Who\'s your favorite instructor?', 
      'answers': ['Max', 'Stephen', 'Max', 'Max'],
    },
  ];

  void _response() {
    setState(() {
      _qIndex++;
    });
    print(_qIndex);
    if (_qIndex < questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _qIndex < questions.length 
        ? Column(
          children: [
            Question(
              questions[_qIndex]['questionText'],
            ),
            ...(questions[_qIndex]['answers'] as List<String>)
                .map((answer) {
              return Answer(_response, answer);
            }).toList()
          ],
        ) : Center(child: Text('You are complete'))
      ),
    );
  }
}
