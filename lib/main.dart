import 'package:flutter/material.dart';
import 'package:quiz/result.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyQuiz());
}

class MyQuiz extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyQuizState();
  }
}

class _MyQuizState extends State<MyQuiz> {
  final _questions = const [
    {
      'questionText': 'What\'s your favourite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 20},
        {'text': 'Green', 'score': 30},
        {'text': 'White', 'score': 40},
      ],
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 10},
        {'text': 'Snake', 'score': 20},
        {'text': 'Elephant', 'score': 30},
        {'text': 'Lion', 'score': 40},
      ],
    },
    {
      'questionText': 'Who\'s your favourite instructor?',
      'answers': [
        {'text': 'Henry', 'score': 5},
        {'text': 'Henry', 'score': 5},
        {'text': 'Henry', 'score': 5},
        {'text': 'Henry', 'score': 5},
      ],
    },
    {
      'questionText': 'Where did you come from?',
      'answers': [
        {'text': 'Malaysia', 'score': 10},
        {'text': 'Singapore', 'score': 20},
        {'text': 'Indonesia', 'score': 30},
        {'text': 'Vietnam', 'score': 40},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex += 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
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
          title: Text('Quiz App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
