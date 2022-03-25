import 'package:expense_app/models/achat_produit.dart';
import 'package:expense_app/models/produit.dart';
import 'package:expense_app/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import 'Achat.dart';

class Authentication {
  final _database = FirebaseDatabase.instance.ref();
  Future<bool> createNewUser(String user, String password) async {
    UserCredential result = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: user, password: password);
    if (result == null) {
      return false;
    } else
      return true;
  }

  Future Connect(String login, String password) async {
    UserCredential result = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: login, password: password);
    // print('${result.user?.uid}');
    return result == null ? "error" : result.user;
  }

  Future<List<Achat>> getAchat(String? id) async {
    final _database = FirebaseDatabase.instance.ref();
    List resultats = [];
    Map res2 = {};
    Map prod = {};
    // return [];
    // ignore: dead_code
    var res =await _database.child('Achats').onValue.listen((event) {
      resultats = event.snapshot.value as List;
      // print(resultats);
    });
    // await print(resultats);
    for (var i = 0; i < resultats.length; i++) {
      print('${resultats[i]}');
    }
    // print('$resultats');
    // _database.child('AchatPoduits').onValue.listen((event) {
    //   res2 = event.snapshot.value as Map;
    // });
    // _database.child('Produit').onValue.listen((event) {
    //   prod = event.snapshot.value as Map;
    // });
    // List<Achat> achat = [];
    // resultats.forEach((key, value) {
    //   // achats
    //   if (value == id) {
    //     Achat a = Achat();
    //     a.achat = [];
    //     a.getUser == value;
    //     a.idAchat = int.parse(key);
    //     res2.forEach((key, value) {
    //       // achatsproduits
    //       Map val = value as Map;
    //       val.forEach((key, value) {
    //         var ione = int.parse(key);
    //         var oneAchat = value as Map;
    //         bool found = false;
    //         oneAchat.forEach((key, value) {
    //           AchatProduit ap = AchatProduit();
    //           if (key == 'idAchat' && value == val) {
    //             found = true;
    //             ap.id = ione;
    //           }
    //           String theval = value as String;
    //           if (found && key == 'idProduit') {
    //             Produit p = Produit();
    //             prod.forEach((key, value) {
    //               if (key == theval) {
    //                 Map v = value as Map;
    //                 p.idproduit = theval;
    //                 v.forEach((key, value) {
    //                   if (key == "description") p.description = value;
    //                   if (key == 'nom') p.nom = value;
    //                   if (key == 'prix') p.prix = value;
    //                 });
    //               }
    //               ap.produit = p;
    //             });
    //           }
    //           a.achat?.add(ap);
    //         });
    //       });
    //     });

    //     achat.add(a);
    //   }
    // });
    // return achat;
    return [];
  }
  
  Future<Produit> getproduit(String? id) async {
    return Produit();
  }
}
