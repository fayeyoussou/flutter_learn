import 'dart:ffi';

import 'package:expense_app/widgets/myhomepage.dart';
import 'package:flutter/material.dart';

class BodyConnexion extends StatefulWidget {
  Function connected;
  BodyConnexion(this.connected);

  @override
  State<BodyConnexion> createState() => _BodyConnexionState();
}

class _BodyConnexionState extends State<BodyConnexion> {
  String? name;

  TextEditingController controller = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: this.controller,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                labelText: "Username",
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 5)),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            TextField(
              controller: this.passwordController,
              obscureText: true, //This will obscure text dynamically
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.password),
                  labelText: "password",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 5)),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.send),
                    splashColor: Colors.lightGreenAccent,
                    tooltip: "Se connecter",
                    onPressed: () {
                      widget.connected();
                    },
                  )),
            ),
            SizedBox(
              height: 25,
              child: Text('error',
                  style: TextStyle(
                      color: Colors.red, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
