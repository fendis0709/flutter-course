import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;

  final Function resetQuizHandler;

  Result(this.totalScore, this.resetQuizHandler);

  String get resultText {
    String resultPhrase;
    if (totalScore >= 40) {
      resultPhrase = 'Selamat, Anda wibu sejati';
    } else if (totalScore >= 30) {
      resultPhrase = 'Anda seorang penikmat anime';
    } else if (totalScore >= 20) {
      resultPhrase = 'Sepertinya Anda kurang menikmati anime';
    } else {
      resultPhrase = 'Anda kurang menikmati hidup. Tontonlah Anime!';
    }
    return resultPhrase;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            Text(
              resultText,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              child: Text(
                'Reset quiz',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.blue),
              ),
              onPressed: resetQuizHandler,
            )
          ],
        ),
      ),
    );
  }
}
