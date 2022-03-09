import 'package:expense_app/widgets/body_connexion.dart';
import 'package:flutter/material.dart';

import 'package:expense_app/widgets/chart.dart';
import 'package:expense_app/widgets/new_transaction.dart';
import 'package:expense_app/widgets/transaction_list.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:expense_app/models/transaction.dart';
// import '../models/transaction.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // String? titleInput;
  bool connected = false;
  final titleController = TextEditingController();

  final amountController = TextEditingController();
  
  final List<Transaction> _userTransactions = [
    Transaction(
        id: 'T1',
        title: 'Chaussure',
        amount: 1000,
        date: DateTime.now().subtract(Duration(days: 2))),
    Transaction(
        id: 'T2',
        title: 'Costume',
        amount: 2000,
        date: DateTime.now().subtract(Duration(days: 3))),
    Transaction(
        id: 'T2',
        title: 'Costume',
        amount: 3000,
        date: DateTime.now().subtract(Duration(days: 1))),
    Transaction(
        id: 'T2',
        title: 'soup kandja',
        amount: 1500,
        date: DateTime.now().subtract(Duration(days: 1)))
  ];
  void _addNew(String txTitle, double txAmount) {
    final newTx = Transaction(
        id: (DateTime.now()).toString(),
        title: txTitle,
        amount: txAmount,
        date: DateTime.now());
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((element) {
      return element.date
          .isAfter(DateTime.now().subtract(const Duration(days: 7)));
    }).toList();
  }

  void _startAddNewTransaction(BuildContext ctx, String produit) {
    showModalBottomSheet(
        context: ctx,
        builder: (bCtx) {
          return GestureDetector(
              onTap: () {},
              child: NewTransaction(
                addNew: _addNew,
                produit: produit,
              ));
        });
  }

  String res = '';
  Future<void> ScanQr() async {
    try {
      res = await FlutterBarcodeScanner.scanBarcode(
          '#FFF', 'Cancel', true, ScanMode.QR);
      _startAddNewTransaction(context, res);
      print('Result = $res');
    } on PlatformException {}
  }

  @override
  Widget build(BuildContext context) {
    void connect() {
    // this.name = controller.text;

    setState(() {
      connected = true;
    });
  }
    // initializeDateFormatting();
    // Intl.defaultLocale = 'fr_FR';
    return Scaffold(
      appBar: AppBar(
        title: const Text('QrCode App'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
      ),
      body: connected ? SingleChildScrollView(
        child: Column(
          // it is the default setting
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              height: 170,
              child: Card(
                color: Theme.of(context).primaryColorDark,
                child: Chart(_recentTransactions),
                elevation: 20,
              ),
            ),
            TransactionList(_userTransactions)
          ],
        ),
      ) : BodyConnexion(()=>connect()),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
       floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => ScanQr(),
      ) ,
    ) ;
  }
}
