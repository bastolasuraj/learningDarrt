import 'package:flutter/material.dart';

void main() {
  runApp(LearningFlutter());
}

class LearningFlutter extends StatelessWidget {
  var _questionIndex = 0;
  void _answerQuestions() {
    _questionIndex = _questionIndex + 1;
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      "What is your birth color?",
      "What is your best friends name?",
      "What is your name?",
      "What is your Father's name?"
    ];
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("QnA"),
          ),
          body: Column(
            children: [
              Text(questions[_questionIndex]),
              RaisedButton(
                child: Text("Answer 1"),
                onPressed: _answerQuestions,
              ),
              RaisedButton(
                child: Text("Answer 2"),
                onPressed: _answerQuestions,
              ),
              RaisedButton(
                child: Text("Answer 3"),
                onPressed: _answerQuestions,
              ),
            ],
          )),
    );
  }
}
