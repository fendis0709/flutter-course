import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function handler;

  final String answer;

  Answer(this.handler, this.answer);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        child: Text(answer),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.lightBlue),
          foregroundColor: MaterialStateProperty.all(Colors.white),
        ),
        onPressed: handler,
      ),
    );
  }
}
