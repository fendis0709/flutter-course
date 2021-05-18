import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/answer.dart';
import 'package:flutter_quiz_app/question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;

  final int questionIndex;

  final Function answerPicked;

  Quiz({
    @required this.questions,
    @required this.questionIndex,
    @required this.answerPicked,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Question(
            questions.elementAt(questionIndex)['question'],
          ),
          ...(questions.elementAt(questionIndex)['answers']
                  as List<Map<String, Object>>)
              .map((answer) {
            return Answer(() => answerPicked(answer['score']), answer['text']);
          }).toList(),
        ],
      ),
    );
  }
}
