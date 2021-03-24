import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String
      questionText; // will never change after initialization in the constructor
  // suggested when using the stateless widget

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // full width of the device
      margin: EdgeInsets.all(10),
      child: Text(
        questionText,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}
