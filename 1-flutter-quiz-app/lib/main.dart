import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/quiz.dart';
import 'package:flutter_quiz_app/result.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  static const _questions = [
    {
      'question': 'Kapan terakhir kali kamu menonton anime?',
      'answers': [
        {
          'text': 'A. Hari ini atau kemarin',
          'score': 20,
        },
        {
          'text': 'B. Seminggu terakhir',
          'score': 15,
        },
        {
          'text': 'C. Dua minggu terakhir',
          'score': 10,
        },
        {
          'text': 'D. Sebulan terakhir',
          'score': 5,
        },
        {
          'text': 'E. Lebih dari sebulan terakhir',
          'score': 0,
        },
      ]
    },
    {
      'question':
          'Apakah kamu pernah menonton Doraemon, Naruto, One Piece, atau Dragon Ball?',
      'answers': [
        {
          'text': 'A. Ya, pernah',
          'score': 20,
        },
        {
          'text': 'B. Kayaknya pernah',
          'score': 10,
        },
        {
          'text': 'C. Belum pernah sama sekali',
          'score': 5,
        }
      ]
    },
  ];

  var _questionIndex = 0;

  var _totalScore = 0;

  void _answerPicked(int score) {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    _totalScore = _totalScore + score;
  }

  void _quizReset() {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Seberapa "WIBU" Anda?'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                questionIndex: _questionIndex,
                answerPicked: _answerPicked,
              )
            : Result(_totalScore, _quizReset),
      ),
    );
  }
}
