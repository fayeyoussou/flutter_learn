import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/result.dart';
import './quiz.dart';

double addNumber(double num1, double num2) {
  return num1 + num2;
}

/**
 *  main is a special function name
 *  it is like java main though
 *  EntryPoint of dart 
 *  dart will automatically look for main file 
 *  and then look for a main function   
 */
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'question': 'what\'s your favorite color faye ? ',
      'answer': [
        {'text': 'Red', 'score': 7},
        {'text': 'Black', 'score': 4},
        {'text': 'White', 'score': 5},
        {'text': 'Green', 'score': 1}
      ]
    },
    {
      'question': "what's your favorite animal ?",
      'answer': [
        {'text': 'Rabbit', 'score': 2},
        {'text': 'Sheep', 'score': 3},
        {'text': 'Tiger', 'score': 5},
        {'text': 'Snake', 'score': 10}
      ]
    },
    {
      'question': "Quel est ton equipe prefere",
      'answer': [
        {'text': 'Milan', 'score': 2},
        {'text': 'Naple', 'score': 4},
        {'text': 'Juve', 'score': 6},
        {'text': 'Inter', 'score': 10}
      ]
    }
  ];
  var _questionIndex = 0;
  int _totalScore = 0;
  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex++;
    });

    print(_questionIndex);
  }

  void _resetQuiz() {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  /**
   * Override the already existing method 
   */
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Application de quiz'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questionIndex: _questionIndex,
                answerQuestion: _answerQuestion,
                questions: _questions)
            : Result(_totalScore,_resetQuiz),
      ),
    );
  }
}
