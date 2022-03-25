import 'package:expense_app/models/achat_produit.dart';
import 'package:expense_app/models/authentication.dart';
import 'package:expense_app/models/exemple.dart';
import 'package:expense_app/models/produit.dart';
import 'package:expense_app/widgets/body_connexion.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:expense_app/widgets/chart.dart';
import 'package:expense_app/widgets/new_transaction.dart';
import 'package:expense_app/widgets/transaction_list.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:expense_app/models/transaction.dart';

import '../models/Achat.dart';
import '../models/conn.dart';
import '../models/user.dart';
import 'map.dart';
// import '../models/transaction.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // String? titleInput;
  bool connected = false;
  final _database = FirebaseDatabase.instance.ref();
  List<AchatProduit> achatEnCours = [];
  List<Achat> achat = [];

  User user = User();
  int id = 1;
  Map all = {'achat': [], 'produit': [], 'achatproduit': []};

  void _addNew() {
    setState(() {
      Future<List<Achat>> listAchat = Authentication().getAchat(user.getId);
    });
  }

  @override
  void initState() {
    super.initState();
    _activeListener();
  }

  void _activeListener() {
    _database.child('Achats').onValue.listen((event) {
      setState(() {
        all['achat'] = event.snapshot.value;
        int id = (event.snapshot.value as List).length;
        all['idAchat'] = id;
      });
    });
    _database.child('Produit').onValue.listen((event) {
      all['produit'] = event.snapshot.value;
    });
    _database.child('AchatPoduits').onValue.listen((event) {
      all['achatproduit'] = event.snapshot.value;
      int id = (event.snapshot.value as List).length;
        all['idAchatProduit'] = id;
    });
  }

  List<Achat> get ListAchate {
    List<Achat> ach = [];
    // print(all['achat']);
    for (var i = 0; i < all['achat'].length; i++) {
      // print(all['achat'][i]);
      print('${all['achat'][i]}');
      if (all['achat'][i] != null && all['achat'][i] == user.getId) {
        print('${all['achat'][i]}\n');
        Achat a = Achat();
        a.achat = [];
        for (var j = 0; j < all['achatproduit'].length; j++) {
          // print(all['achatproduit'][j]);
          if (all['achatproduit'][j] != null &&
              all['achatproduit'][j]['idAchat'] == i) {
            // print('${all['achatproduit'][j]}');
            AchatProduit ap = AchatProduit();
            ap.idAchat = i;
            // print('${all['achatproduit'][j]['quantite']}');
            ap.quantite = all['achatproduit'][j]['quantite'];
            var apro = all['produit'] as Map;
            apro.forEach((key, value) {
              // print(
              //     '${all['achatproduit'][j]['idProduit'].toString() == key.toString()} == $key');
              if (all['achatproduit'][j]['idProduit'].toString() ==
                  key.toString()) {
                Produit prod = Produit();
                prod.description = value['description'];
                prod.nom = value['nom'];
                print(value['nom']);
                prod.idproduit = key;
                // print(key);
                // print(value['prix']);
                prod.prix = value['prix'].toDouble();
                ap.produit = prod;
              }
            });
            a.achat.add(ap);
          }
        }
        ach.add(a);
        // print(ach);
      }
    }
    // for (var i = 0; i < ach.length; i++) {
    //   ach[i].achat[0].produit?.getNom;
    // }
    return ach;
  }

  void _startAddNewTransaction(
      BuildContext ctx, List<AchatProduit> achatProduit) {
    showModalBottomSheet(
        context: ctx,
        builder: (bCtx) {
          return GestureDetector(
              onTap: () {},
              child: NewTransaction(
                addNew: _addNew,
                achatProduit: achatProduit,
              ));
        });
  }

  String res = '';
  Future<void> ScanQr(List<AchatProduit> achatEnCours) async {
    try {
      res = await FlutterBarcodeScanner.scanBarcode(
          '#FFF', 'Cancel', true, ScanMode.QR);
      Authentication().getproduit(res).then((value) {
        int value = 0;
        int val2 = 0;
        _database.child('Achats').onValue.listen((event) {
          List val = event.snapshot.value as List;
          value = val.length;
          val2 = 0;
          _database.child('AchatPoduits').onValue.listen((event) {
            List val = event.snapshot.value as List;
            val2 = val.length;
          });
        });
        _database.child('AchatPoduits').update({
          all['idAchatProduit'].toString(): {'idAchat': all['idAchat'], 'idProduit': res, 'quantite': 2}
        });
        _database.child('Achats').update({all['idAchat'].toString(): user.getId});
      });

      print('Result = $res');
    } on PlatformException {}
  }

  @override
  Widget build(BuildContext context) {
    // print(user + 'user <-');
    Future<bool> connect(String usern, String password) async {
      // c.getAchat(1);
      // this.name = controller.text;
      return Authentication().Connect(usern, password).then((value) {
        if (value == "error")
          return false;
        else {
          setState(() {
            user.id = value.uid;
            connected = true;
          });
          return true;
        }
      });
    }

    // Future<List<Achat>> listAchat =
    //     Authentication().getAchat('IxovWcVehwZb3hvY7VoQE3bLV452');
    // initializeDateFormatting();
    // Intl.defaultLocale = 'fr_FR';
    print('debut');

    return connected
        ? Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    // print(user.getId);
                    print('${ListAchate}');
                  },
                  icon: const Icon(Icons.help)),
              title: const Text('QrCode App'),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) => MyMap())));
                    },
                    icon: const Icon(Icons.location_on))
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: double.infinity,
                    height: 200,
                    child: Card(
                      color: Theme.of(context).primaryColorDark,
                      child: Chart(ListAchate, 200000),
                      elevation: 20,
                    ),
                  ),
                  TransactionList(ListAchate)
                ],
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () => ScanQr(achatEnCours),
            ),
          )
        : BodyConnexion(connect, user.getId);
  }
}
