import "package:flutter/material.dart";

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final Function answerQuestion;
  final List<Map<String, Object>> questions;
  final int questionIndex;

  Quiz(this.answerQuestion, this.questions, this.questionIndex);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(
          (questions[questionIndex]['questionText'] as String),
        ),
        ...(questions[questionIndex]['answers'] as List<
                Map<String,
                    Object>>) // ... takes a list and pull all the elements out and adds to the surrounding list
            .map((answer) {
          return Answer(
              () => answerQuestion(answer['score']), answer['text'] as String);
        }).toList(),
      ],
    );
  }
}
