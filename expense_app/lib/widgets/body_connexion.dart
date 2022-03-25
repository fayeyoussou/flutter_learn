import 'dart:ffi';

import 'package:expense_app/models/authentication.dart';
import 'package:expense_app/models/conn.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/user.dart';

class BodyConnexion extends StatefulWidget {
  Function(String, String) connected;
  String err;
  // Future<User> user;
  BodyConnexion(this.connected, this.err);

  @override
  State<BodyConnexion> createState() => _BodyConnexionState();
}

class _BodyConnexionState extends State<BodyConnexion> {
  String? name;
  bool con = true;
  String err2 = "";
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController regemail = TextEditingController();
  TextEditingController regPAssword = TextEditingController();
  Map all = {};

  final _database = FirebaseDatabase.instance.ref();
  @override
  void initState() {
    super.initState();
    _activeListener();
  }

  void _activeListener() {
    _database.child('Achats').onValue.listen((event) {
      setState(() {
        
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
        // actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
        title: Text(con ? 'Connexion' : 'Inscription'),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  con = !con;
                });
              },
              icon: Icon(con ? Icons.person_add : Icons.person))
        ],
      ),
      body: AnimatedSize(
          duration: Duration(seconds: 2),
          alignment: Alignment.centerLeft,
          child: con
              ? Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          controller: this.emailController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            labelText: "Username",
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blue, width: 5)),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        TextField(
                          controller: this.passwordController,
                          obscureText:
                              true, //This will obscure text dynamically
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.password),
                              labelText: "password",
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.blue, width: 5)),
                              suffixIcon: IconButton(
                                icon: Icon(Icons.send),
                                splashColor: Colors.lightGreenAccent,
                                tooltip: "Se connecter",
                                onPressed: () async {
                                  // final database =
                                  //     FirebaseDatabase.instance.ref();
                                  // final ref = database.child('User');
                                  // ref
                                  //     .set({
                                  //       'prenom': 'Youssoupha',
                                  //       'nom': 'Faye'
                                  //     })
                                  //     .then((_) => print('success'))
                                  //     .catchError(
                                  //         (error) => print('eror $error'));
                                  bool res = await widget.connected(
                                      emailController.text,
                                      passwordController.text);
                                  if (res == false) {
                                    setState(() {
                                      widget.err =
                                          "mot de passe ou login incorrect";
                                    });
                                  }
                                },
                              )),
                        ),
                        SizedBox(
                          height: 25,
                          child: Text(widget.err,
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                )
              : Container(
                  margin: EdgeInsets.only(top: 100),
                  height: 300,
                  child: SingleChildScrollView(
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextField(
                              controller: this.regemail,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.person),
                                labelText: "Email",
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.blue, width: 5)),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            TextField(
                              // inputFormatters: [
                              //   LengthLimitingTextInputFormatter(4),
                              // ],

                              controller: this.regPAssword,
                              obscureText:
                                  true, //This will obscure text dynamically
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.password),
                                  labelText: "password",
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blue, width: 5)),
                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.send),
                                    splashColor: Colors.lightGreenAccent,
                                    tooltip: "S'inscrire",
                                    onPressed: () async {
                                      bool verif = true;
                                      String error =
                                          "veuillez remplir les champs avec au moins 4 caracteres : \n";
                                      if (this.regemail.text.trim().length <
                                          4) {
                                        verif = false;
                                        error += "Email ";
                                      }
                                      if (this.regPAssword.text.trim().length <
                                          6) {
                                        verif = false;
                                        error += "password ";
                                      }

                                      if (verif) {
                                        setState(() {
                                          Authentication()
                                              .createNewUser(regemail.text,
                                                  regPAssword.text)
                                              .then((value) {
                                            if (value)
                                              setState(() {
                                                con = true;
                                              });
                                            else
                                              setState(() {
                                                err2 = "Email deja Existant";
                                              });
                                          });
                                        });
                                      } else {
                                        setState(() {
                                          err2 = error;
                                        });
                                      }
                                    },
                                  )),
                            ),
                            SizedBox(
                              height: 25,
                              child: Text(err2,
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )),
    );
  }
}
