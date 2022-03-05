import './transaction.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: 'T1', title: 'Chaussure', amount: 1000, date: DateTime.now()),
    Transaction(id: 'T2', title: 'Costume', amount: 2000, date: DateTime.now())
  ];
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
            Column(
              children: transactions
                  .map((e) => Card(
                        elevation: 10,
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.purple,width: 3),
                                  color: Colors.cyan
                                  
                                  ),
                              child: Text(
                                e.amount.toString(),
                                style:TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.purple
                                ),),
                            ),
                            Column(
                              
                              crossAxisAlignment: CrossAxisAlignment.end ,
                              children: [
                                Text(
                                  e.title
                                  ,style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.amber
                                  ),),
                                Text(
                                  e.date.toString(),
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 10
                                  ),
                                  )
                              ],
                            )
                          ],
                        ),
                      ))
                  .toList(),
            )
          ],
        ));
  }
}
