import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

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
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Green', 'score': 2},
        {'text': 'Red', 'score': 5},
        {'text': 'Blue', 'score': 3},
        {'text': 'White', 'score': 4},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Dog', 'score': 1},
        {'text': 'Cat', 'score': 8},
        {'text': 'Elephant', 'score': 4},
        {'text': 'Panda', 'score': 2},
      ],
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': [
        {'text': 'Max', 'score': 2},
        {'text': 'Stephen', 'score': 1},
        {'text': 'Max', 'score': 4},
        {'text': 'Max', 'score': 1},
      ],
    },
  ];

  var _qIndex = 0;
  var _totalScore = 0;

  void _resetQuiz(){
    setState(() {
      _qIndex = 0;
      _totalScore = 0;
    });
  }

  void _response(int score) {
    _totalScore += score;
    setState(() {
      _qIndex++;
    });
    print(_qIndex);
    if (_qIndex < _questions.length) {
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
        body: _qIndex < _questions.length
            ? Quiz(
                response: _response,
                qIndex: _qIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
