import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();
    return Container(
      height: 300,
      child: transactions.isEmpty
          ? Column(
            crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Vous n\'avez rien achete \npour le moment',
                  style: Theme.of(context).textTheme.bodyText1,textAlign: TextAlign.center,
                ),
                SizedBox(height: 20,),
                Container(
                  height: 200,
                  child: Image.asset('assets/images/waiting.png',fit: BoxFit.cover,))
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
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
                          '${transactions[index].amount.toInt()} F',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Theme.of(context).primaryColorDark),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(transactions[index].title,
                              style: Theme.of(context).textTheme.bodyText1),
                          Text(
                            DateFormat('EEEEE d MMM yyyy', 'fr')
                                .format(transactions[index].date),
                            style: TextStyle(color: Colors.grey, fontSize: 10),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
