import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 40) {
      resultText = 'You are awesome and innocent!';
    } else if (resultScore <= 50) {
      resultText = 'Pretty likeable';
    } else if (resultScore <= 60) {
      resultText = 'You are ... strange?!';
    } else {
      resultText = 'You are so bad!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
            onPressed: resetHandler,
            child: Text('Restart Quiz!'),
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
