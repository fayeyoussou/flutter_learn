import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;
  TransactionList(this.userTransactions);
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();
    return Column(
      children: userTransactions
          .map((e) => Card(
                elevation: 10,
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.purple, width: 3),
                          color: Colors.cyan),
                      child: Text(
                        '${e.amount.toInt()} F',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.purple),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          e.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.amber),
                        ),
                        Text(
                          DateFormat('EEEEE d MMM yyyy', 'fr').format(e.date),
                          style: TextStyle(color: Colors.grey, fontSize: 10),
                        )
                      ],
                    )
                  ],
                ),
              ))
          .toList(),
    );
  }
}
