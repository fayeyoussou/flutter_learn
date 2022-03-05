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
            primary: Color.fromARGB(255, 51, 48, 177),
            side: BorderSide(color: Color.fromARGB(204, 115, 157, 204),),),
        child: Text(this.answerText),
        onPressed: selectedHandler,
      ),
    );
  }
}
