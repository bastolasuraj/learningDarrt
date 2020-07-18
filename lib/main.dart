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
      "answers": [
        {"score": 10, "text": "Red"},
        {"score": 20, "text": "Green"},
        {"score": 30, "text": "Blue"},
        {"score": 40, "text": "Black"},
        {"score": 50, "text": "White"}
      ]
    },
    {
      "questionText": "What is your best friends name?",
      "answers": [
        {"score": 20, "text": "John"},
        {"score": 30, "text": "Oliver"},
        {"score": 40, "text": "Felicity"},
        {"score": 50, "text": "Thea"},
        {"score": 10, "text": "Roy"}
      ]
    },
    {
      "questionText": "What is your name?",
      "answers": [
        {"score": 30, "text": "Spartan"},
        {"score": 40, "text": "Arrow"},
        {"score": 50, "text": "Over Watch"},
        {"score": 10, "text": "Speedy"},
        {"score": 20, "text": "Arsenal"}
      ]
    },
    {
      "questionText": "What is your Father's name?",
      "answers": [
        {"score": 40, "text": "JJ"},
        {"score": 50, "text": "Robert"},
        {"score": 10, "text": "Gwendolyn"},
        {"score": 20, "text": "Maria"},
        {"score": 30, "text": "Laila"}
      ]
    },
    {
      "questionText": "What is your favourite animal?",
      "answers": [
        {"score": 50, "text": "Snake"},
        {"score": 10, "text": "Hawk"},
        {"score": 20, "text": "Eagle"},
        {"score": 30, "text": "Frog"},
        {"score": 40, "text": "Slug"}
      ]
    }
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestions(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Simple Quiz"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestions,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
