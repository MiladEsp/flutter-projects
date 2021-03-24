import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetQuiz;

  Result(this.resultScore, this.resetQuiz);

  String get resultPhrase {
    //getter
    var resultText;
    if (resultScore <= 8) {
      resultText = 'You are awesome and innocent! Your score is  $resultScore';
    } else if (resultScore <= 12) {
      resultText = 'Pretty likeable! Your score is  $resultScore';
    } else if (resultScore <= 16) {
      resultText = 'You are ... strange?! Your score is  $resultScore';
    } else {
      resultText = 'baaad! Your score is  $resultScore';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase, // no need for ()
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton(
            child: Text('Restart Quiz!'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.teal[200]),
              foregroundColor: MaterialStateProperty.all(Colors.white),
              textStyle: MaterialStateProperty.all(
                  TextStyle(fontWeight: FontWeight.bold)),
            ),
            onPressed: () => resetQuiz(),
          ),
        ],
      ),
    );
  }
}
