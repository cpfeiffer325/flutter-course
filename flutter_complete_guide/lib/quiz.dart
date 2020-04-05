import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int qIndex;
  final Function response;

  Quiz({
    @required this.questions,
    @required this.response,
    @required this.qIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[qIndex]['questionText'],
        ),
        ...(questions[qIndex]['answers'] as List<String>).map((answer) {
          return Answer(response, answer);
        }).toList()
      ],
    );
  }
}
