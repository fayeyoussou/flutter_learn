import 'package:flutter/material.dart';

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

class MyApp extends StatelessWidget {
  /**
   * Override the already existing method 
   */
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Text('Youssoupha FAYE'),
    );
  }
}
