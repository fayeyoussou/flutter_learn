import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  /**
   *    if you get an error with the selectedHandler property
   *    you can change final function selectHandler; to 
   *    " final voidCallback selectedHandler ""
   */
  final Function selectedHandler;
  Answer(this.selectedHandler);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Color.fromARGB(255, 33, 78, 163),
        textColor: Color.fromARGB(255, 193, 223, 233),
        child: Text('Answer 1'),
        onPressed: selectedHandler,
      ),
    );
  }
}
