import 'package:expense_app/widgets/connexion.dart';
import 'package:expense_app/widgets/myhomepage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  Future<FirebaseApp> firebaseApp = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
              .copyWith(secondary: Colors.deepPurple)
              .copyWith(tertiary: Colors.amber),
          fontFamily: 'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.blueAccent),
              bodyText2: const TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.black)),
          appBarTheme: const AppBarTheme(
              titleTextStyle: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.amberAccent))),
      title: 'Expense',
      home: FutureBuilder(
        future: firebaseApp,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("error");
          } else if (snapshot.hasData)
            return MyHomePage();
          else
            return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
