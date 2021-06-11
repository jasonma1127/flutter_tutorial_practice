import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp()); //only for the function with one instruction

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var questionIndex = 0;
  var totalScore = 0;

  void resultQuiz() {
    setState(() {
      questionIndex = 0;
      totalScore = 0;
    });
  }

  void answerQuestion(int score) {
    // totalScore = totalScore + score;
    setState(() {
      totalScore = totalScore + score;
      questionIndex = questionIndex + 1;
    });
    print(questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    List questions = [
      {
        'questionText': 'What\'s your favorite color?',
        'answers': [
          {'text': 'Black', 'score': 10},
          {'text': 'Red', 'score': 5},
          {'text': 'Green', 'score': 2},
          {'text': 'Whilte', 'score': 3}
        ]
      },
      {
        'questionText': 'What\'s your favorite animal',
        'answers': [
          {'text': 'Tiger', 'score': 8},
          {'text': 'Cat', 'score': 2},
          {'text': 'Dog', 'score': 3},
          {'text': 'Lion', 'score': 10}
        ]
      },
      {
        'questionText': 'What\'s your favorite programming Language',
        'answers': [
          {'text': 'C++', 'score': 8},
          {'text': 'Java', 'score': 6},
          {'text': 'Python', 'score': 3},
          {'text': 'HTML', 'score': 1}
        ]
      }
    ];

    return MaterialApp(
        home: Scaffold(
      //Scaffold create a base UI for app
      appBar: AppBar(
        title: Text('My First App'),
      ),
      body: questionIndex < questions.length
          ? Quiz(
              answerQuestion: answerQuestion,
              questionIndex: questionIndex,
              questions: questions,
            )
          : Result(totalScore, resultQuiz),
    ));
  }
}
