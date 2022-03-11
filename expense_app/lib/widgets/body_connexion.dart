import 'dart:ffi';


import 'package:flutter/material.dart';


import '../models/user.dart';

class BodyConnexion extends StatefulWidget {
  Function(String, int) connected;
  // Future<User> user;
  BodyConnexion(this.connected);

  @override
  State<BodyConnexion> createState() => _BodyConnexionState();
}

class _BodyConnexionState extends State<BodyConnexion> {
  String? name;
  bool con = true;
  
  TextEditingController controller = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
              icon: const Icon(Icons.person_add))
        ],
      ),
      body: AnimatedSwitcher(
        duration: Duration(seconds: 3),
        
        child : con ? Align(
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
                        widget.connected(controller.text,
                            int.parse(passwordController.text));
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
      ):
      Align(
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
                    labelText: "passi",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 5)),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.send),
                      splashColor: Colors.lightGreenAccent,
                      tooltip: "Se connecter",
                      onPressed: () {
                        widget.connected(controller.text,
                            int.parse(passwordController.text));
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
      )
      ),
    )  
     
    
    
    
    ;
  }
}
