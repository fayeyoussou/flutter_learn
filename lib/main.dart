import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

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
  var _questionIndex = 0;
  void _answerQuestion() {
    setState(() {
      _questionIndex++;
    });
    print(_questionIndex);
  }

  /**
   * Override the already existing method 
   */
  @override
  Widget build(BuildContext context) {
    const question = const [
      {
        'question': 'what\'s your favorite color faye ? ',
        'answer': ['Red', 'Green', 'White', 'Green']
      },
      {
        'question': "what's your favorite animal ?",
        'answer': ['Rabbit', 'Sheep', 'Horse', 'Goat']
      }
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Question('My first App'),
        ),
        body: Column(
          children: <Widget>[
            Question( question[_questionIndex]['question']),
            ...(question[_questionIndex]['answer'] as List<String>)
                .map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}
