import 'dart:developer';

import 'package:expense_app/models/conn.dart';
import 'package:flutter/material.dart';
import '../models/Achat.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class TransactionList extends StatelessWidget {
  // final List<Transaction> transactions;
  List<Achat> lista;
  TransactionList(this.lista);
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();
    // Future<List<Achat>> _achats = Conn().getAchat(id);
    // print('id ---> $id');
    return Container(
        height: 350,
        child: 
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
                                  DateFormat('EEEEE d MMM yyyy', 'fr').format(
                                      DateTime.now()),
                                ),
                              ),
                            );
                          },
                          itemCount: lista.length,
                        ),
                      ),
             
        );
  }
}
