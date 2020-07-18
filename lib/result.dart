import "package:flutter/material.dart";

class Result extends StatelessWidget {
  final int finalScore;
  final Function resetQuizFunction;

  Result(this.finalScore, this.resetQuizFunction);

  String get resultPhrase {
    var resultText = "You Have Completed the Quiz";
    if (finalScore < 100) {
      resultText = resultText + "\n You have failed the test of life";
    } else if (finalScore <= 200) {
      resultText = resultText + "\n You have an average life";
    } else {
      resultText = resultText + "\n You are a life winner";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          FlatButton(onPressed: resetQuizFunction, child: Text("Reset The Quiz"))
        ],
      ),
    );
  }
}
