import 'package:flutter/material.dart';

void main() {
  runApp(LearningFlutter());
}

class LearningFlutter extends StatefulWidget {
  @override
  LearningFlutterState createState() => LearningFlutterState();
}

class LearningFlutterState extends State<LearningFlutter> {
  var questionIndex = 0;

  void answerQuestions() {
    setState(() {
      questionIndex = questionIndex + 1;
    });
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
              Text(questions[questionIndex]),
              RaisedButton(
                child: Text("Answer 1"),
                onPressed: answerQuestions,
              ),
              RaisedButton(
                child: Text("Answer 2"),
                onPressed: answerQuestions,
              ),
              RaisedButton(
                child: Text("Answer 3"),
                onPressed: answerQuestions,
              ),
            ],
          )),
    );
  }
}
