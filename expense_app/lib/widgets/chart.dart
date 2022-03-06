import 'package:expense_app/models/chartVal.dart';
import 'package:expense_app/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  Chart(this.recentTransactions);
  List<ChartValue> get TransVal {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0;
      for (var i = 0; i < this.recentTransactions.length; i++) {
        if (weekDay.day == this.recentTransactions[i].date.day &&
            this
                .recentTransactions[i]
                .date
                .isAfter(DateTime.now().subtract(Duration(days: 30)))) {
          totalSum += recentTransactions[i].amount;
        }
      }
      return ChartValue(DateFormat.E().format(weekDay).substring(0,1), totalSum);
      // return {'day': DateFormat.E().format(weekDay), 'amount': totalSum};
    });
  }

  @override
  Widget build(BuildContext context) {
    print(TransVal);
    return Card(
      
      elevation: 20,
      margin: EdgeInsets.all(20),
      child: Row(
        children: TransVal.map((e) {
          return Text(e.day);
        }).toList(),
      ),
    );
  }
}
