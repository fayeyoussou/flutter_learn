import 'dart:developer';

import 'package:expense_app/models/conn.dart';
import 'package:flutter/material.dart';
import '../models/Achat.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class TransactionList extends StatelessWidget {
  // final List<Transaction> transactions;
  final int id;
  TransactionList(this.id);
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();
    Future<List<Achat>> _achats = Conn().getAchat(id);
    print('id ---> $id');
    return Container(
        height: 350,
        child: FutureBuilder<List<Achat>>(
          future: _achats, // a previously-obtained Future<String> or null
          builder: (BuildContext context, AsyncSnapshot<List<Achat>> snapshot) {
            List<Widget> children;
            if (snapshot.hasData) {
              List<Achat> lista = snapshot.data ?? [];
              int len = snapshot.data?.length ?? 0;
              print('len ${snapshot.data?.length}');
              print(snapshot.data![0].achat![0].produit!.nom);
              // print(snapshot.data?.id);
              // print(snapshot.data!.first.dateAchat);
              children = <Widget>[
                lista.isEmpty
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Vous n\'avez rien achete \npour le moment',
                            style: Theme.of(context).textTheme.bodyText1,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                              height: 200,
                              child: Image.asset(
                                'assets/images/waiting.png',
                                fit: BoxFit.cover,
                              ))
                        ],
                      )
                    : Container(
                      height: 350,
                      child: ListView.builder(
                          itemBuilder: (context, index) {
                            return Card(
                              margin: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 5),
                              child: ListTile(
                                leading: CircleAvatar(
                                  radius: 30,
                                  child: Padding(
                                      padding: EdgeInsets.all(5),
                                      child: FittedBox(
                                          child: Text(
                                              '${(lista[index].prix / 1000).toStringAsFixed(2)}K'))),
                                ),
                                title: Text(
                                  lista[index].title,
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                subtitle: Text(
                                  DateFormat('EEEEE d MMM yyyy', 'fr')
                                      .format(lista[index].dateAchat as DateTime),
                                ),
                              ),
                            );
                            //   return Card(
                            //     elevation: 10,
                            //     child: Row(
                            //       children: [
                            //         Container(
                            //           padding: EdgeInsets.all(10),
                            //           margin:
                            //               EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                            //           decoration: BoxDecoration(
                            //               borderRadius: BorderRadius.circular(10),
                            //               border: Border.all(color: Colors.purple, width: 3),
                            //               color: Colors.cyan),
                            //           child: Text(
                            //             '${transactions[index].amount.toInt()} F',
                            //             style: TextStyle(
                            //                 fontWeight: FontWeight.bold,
                            //                 fontSize: 20,
                            //                 color: Theme.of(context).primaryColorDark),
                            //           ),
                            //         ),
                            //         Column(
                            //           crossAxisAlignment: CrossAxisAlignment.start,
                            //           children: [
                            //             Text(transactions[index].title,
                            //                 style: Theme.of(context).textTheme.bodyText1),
                            //             Text(
                            //               DateFormat('EEEEE d MMM yyyy', 'fr')
                            //                   .format(transactions[index].date),
                            //               style: TextStyle(color: Colors.grey, fontSize: 10),
                            //             )
                            //           ],
                            //         )
                            //       ],
                            //     ),
                            //   );
                          },
                          itemCount: len,
                        ),
                    ),
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
        ));
  }
}
