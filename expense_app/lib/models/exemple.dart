import 'package:expense_app/models/conn.dart';
import 'package:expense_app/models/user.dart';
import 'package:flutter/material.dart';



class Exemple extends StatefulWidget {
  const Exemple({Key? key}) : super(key: key);

  @override
  State<Exemple> createState() => _ExempleState();
}

class _ExempleState extends State<Exemple> {
  final Future<User> _calculation = Conn().findUserByid(2);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // style: Theme.of(context).textTheme.headline2!,
      // textAlign: TextAlign.center,
      child: FutureBuilder<User>(
        future: _calculation, // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            children = <Widget>[
              const Icon(
                Icons.check_circle_outline,
                color: Colors.green,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Result: ${snapshot.data?.login}'),
              )
            ];
          } else if (snapshot.hasError) {
            children = <Widget>[
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Error: ${snapshot.error}'),
              )
            ];
          } else {
            children = const <Widget>[
              SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Awaiting result...'),
              )
            ];
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          );
        },
      ),
    );
  }
}
