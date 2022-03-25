import 'package:expense_app/models/chartVal.dart';
import 'package:expense_app/models/transaction.dart';
import 'package:expense_app/widgets/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/Achat.dart';

class Chart extends StatelessWidget {
  List<Achat> listAchat;
  double somme;
  Chart(this.listAchat, this.somme);
  List<ChartValue> get getTransVal {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0;
      for (var i = 0; i < listAchat.length; i++) {
        if (weekDay.day == listAchat[i].getDateAchat.day &&
            listAchat[i]
                .getDateAchat
                .isAfter(DateTime.now().subtract(Duration(days: 30)))) {
          totalSum += listAchat[i].prix;
        }
      }
      return ChartValue(
          DateFormat.E().format(weekDay).substring(0, 2), totalSum);
      // return {'day': DateFormat.E().format(weekDay), 'amount': totalSum};
    }).reversed.toList();
  }

  double get depMax {
    return getTransVal.fold(0.0, (sum, element) {
      return sum + element.amount;
    });
  }

  int get len {
    return getTransVal.length;
  }

  // double get depMax {
  //   return TransVal.fold(0.0, (sum, element) {
  //     return sum + element.amount;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // print('value is $ca');
    return 
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text('Fonds : $somme',
                      textAlign: TextAlign.center,
                      textWidthBasis: TextWidthBasis.longestLine,
                      style: Theme.of(context).textTheme.bodyText2),
                ),
                Card(
                  elevation: 20,
                  margin: EdgeInsets.all(18),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: getTransVal.map((e) {
                        return Flexible(
                            fit: FlexFit.tight,
                            child: ChartBar(
                                e, depMax == 0 ? 0.0 : e.amount / depMax));
                      }).toList(),
                    ),
                  ),
                ),
              ],
            );
  }
}
