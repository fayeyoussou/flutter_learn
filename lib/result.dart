import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int scoreTotal;
  final VoidCallback reset;
  Result(this.scoreTotal, this.reset);
  String get result {
    var resultText = "terminé !!! ";
    if (scoreTotal < 8) {
      resultText += "tu es tellement innocent";
    } else if (scoreTotal < 16) {
      resultText += "Parfait";
    } else {
      resultText += "Tu es degueu ";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            result,
            style: TextStyle(
                fontSize: 46, fontWeight: FontWeight.bold, fontFamily: "Arial"),
            textAlign: TextAlign.center,
          ),
          FlatButton(onPressed: reset, textColor: Color.fromARGB(255, 69, 69, 206),child: Text('Recommencer '))
        ],
      ),
    );
  }
}
