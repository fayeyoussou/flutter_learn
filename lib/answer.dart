import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  /**
   *    if you get an error with the selectedHandler property
   *    you can change final function selectHandler; to 
   *    " final voidCallback selectedHandler ""
   */
  final VoidCallback selectedHandler;
  final String answerText;
  Answer(this.selectedHandler, this.answerText);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            primary: Colors.amberAccent,
            side: BorderSide(color: Color.fromRGBO(120, 60, 30, 0.8),),),
        child: Text(this.answerText),
        onPressed: selectedHandler,
      ),
    );
  }
}
