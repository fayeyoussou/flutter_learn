import 'dart:ffi';

import 'package:expense_app/models/conn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/user.dart';

class BodyConnexion extends StatefulWidget {
  Function(String, int) connected;
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
  TextEditingController controller = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController prenom = TextEditingController();
  TextEditingController nom = TextEditingController();

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
                          controller: this.controller,
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
                                  bool res = await widget.connected(
                                      controller.text,
                                      int.parse(passwordController.text));
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
                              controller: this.controller,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.person),
                                labelText: "Username",
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.blue, width: 5)),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            TextField(
                              controller: this.controller,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.person),
                                labelText: "prenom",
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.blue, width: 5)),
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            TextField(
                              controller: this.controller,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.person),
                                labelText: "nom",
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.blue, width: 5)),
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            TextField(
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(4),
                              ],
                              keyboardType: TextInputType.number,
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
                                    
                                    onPressed: () {
                                      Conn c = Conn();
                                      bool verif = true;
                                      String error =
                                          "veuillez remplir les champs avec au moins 4 caracteres : \n";
                                      if (this.controller.text.trim().length < 4) {
                                        verif = false;
                                        error += "username ";
                                      }
                                      if (this
                                              .passwordController
                                              .text
                                              .trim()
                                              .length <
                                          4) {
                                        verif = false;
                                        error += "password ";
                                      }
                                      if (this.prenom.text.trim().length < 4) {
                                        verif = false;
                                        error += "prenom ";
                                      }
                                      if (this.nom.text.trim().length < 4) {
                                        verif = false;
                                        error += "nom";
                                      }
                                      if (verif) {
                                        setState(() {
                                          err2 = "connected";
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
