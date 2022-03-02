import 'package:flutter/material.dart';
import './question.dart';

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
    var question = [
      "what's your favorite color faye ? ",
      "what's your favorite animal ?"
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Question('My first App'),
        ),
        body: Column(
          children: <Widget>[
            Question(question[_questionIndex]),
            RaisedButton(
              child: Text(question[1]),
              onPressed: null,
            ),
            RaisedButton(
              child: Text(question.elementAt(1)),
              onPressed: _answerQuestion,
            )
          ],
        ),
      ),
    );
  }
}
