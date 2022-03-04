import 'package:flutter/material.dart';
import './answer.dart';
import './question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final void Function (int) answerQuestion;
  final int questionIndex;
  Quiz({required this.answerQuestion,required this.questions, required this.questionIndex});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(questions[questionIndex]['question'] as String),
        ...(questions[questionIndex]['answer'] as List<Map<String,Object>>).map((answer) {
          return Answer(()=>answerQuestion(answer['score'] as int), answer['text'] as String);
        }).toList()
      ],
    );
  }
}
