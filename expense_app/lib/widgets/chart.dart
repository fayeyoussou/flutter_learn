import 'package:expense_app/models/chartVal.dart';
import 'package:expense_app/models/transaction.dart';
import 'package:expense_app/widgets/chart_bar.dart';
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
      return ChartValue(
          DateFormat.E().format(weekDay).substring(0, 2), totalSum);
      // return {'day': DateFormat.E().format(weekDay), 'amount': totalSum};
    });
  }

  double get depMax {
    return TransVal.fold(0.0, (sum, element) {
      return sum + element.amount;
    });
  }

  @override
  Widget build(BuildContext context) {
    // print('value is $ca');
    return Card(
      elevation: 20,
      margin: EdgeInsets.all(20),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: TransVal.map((e) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(e, depMax == 0 ? 0.0 : e.amount / depMax));
          }).toList(),
        ),
      ),
    );
  }
}
