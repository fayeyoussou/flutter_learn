import 'package:flutter/material.dart';
import 'package:football_app/championnat_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Football App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChampionnatScreen(),
    );
  }
}
