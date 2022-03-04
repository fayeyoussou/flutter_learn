import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int scoreTotal;
  Result(this.scoreTotal);
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
      child: Text(
        result,
        style: TextStyle(
            fontSize: 46, fontWeight: FontWeight.bold, fontFamily: "Arial"),
      ),
    );
  }
}
