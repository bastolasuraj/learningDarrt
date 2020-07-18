import "package:flutter/material.dart";
import './quiz.dart';
import './result.dart';

void main() {
  runApp(LearningFlutter());
}

class LearningFlutter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LearningFlutterState();
  }
}

class _LearningFlutterState extends State<LearningFlutter> {
  final _questions = const [
    {
      "questionText": "What is your birth color?",
      "answers": ["Red", "Green", "Blue", "Black", "White"]
    },
    {
      "questionText": "What is your best friends name?",
      "answers": ["John", "Oliver", "Felicity", "Thea", "Roy"]
    },
    {
      "questionText": "What is your name?",
      "answers": ["Spartan", "Arrow", "Over Watch", "Speedy", "Arsenal"]
    },
    {
      "questionText": "What is your Father's name?",
      "answers": ["JJ", "Robert", "Gwendolyn", "Maria", "Laila"]
    },
  ];
  var _questionIndex = 0;

  void _answerQuestions() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("QnA"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestions,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(),
      ),
    );
  }
}
