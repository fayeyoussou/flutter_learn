import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
        Container(
          width: double.infinity,
          height: 100,
          child: Card(
            color: Color.fromARGB(255, 209, 38, 104),
            child: Text('Chart!'),
            elevation: 5,
            
            
          ),
        ),
        Container(
          
          height: 50,
          child: Card(
            color: Colors.tealAccent,
            child: Text('List of transaction'),
            elevation: 10,
          ),
        )
      ],)
    );
  }
}
