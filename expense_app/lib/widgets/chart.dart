import 'package:expense_app/models/chartVal.dart';
import 'package:expense_app/models/transaction.dart';
import 'package:expense_app/widgets/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/Achat.dart';

class Chart extends StatelessWidget {
  Future<List<Achat>> listAchat;
  double somme;
  Chart(this.listAchat,this.somme);
  List<ChartValue> getTransVal(List<Achat> listAchat) {
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
    });
  }

  // double get depMax {
  //   return TransVal.fold(0.0, (sum, element) {
  //     return sum + element.amount;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // print('value is $ca');
    return FutureBuilder<List<Achat>>(
      future: listAchat, // a previously-obtained Future<String> or null
      builder: (BuildContext context, AsyncSnapshot<List<Achat>> snapshot) {
        List<Widget> children;
        if (snapshot.hasData) {
          List<Achat> lista = snapshot.data ?? [];
          int len = snapshot.data?.length ?? 0;
          List<ChartValue> TransVal = getTransVal(lista).reversed.toList();
          double depMax = TransVal.fold(0.0, (sum, element) {
            return sum + element.amount;
          });
          // print(snapshot.data?.id);
          // print(snapshot.data!.first.dateAchat);
          children = <Widget>[
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top : 10.0),
                  child: Text('Fonds : $somme',textAlign: TextAlign.center,textWidthBasis: TextWidthBasis.longestLine,style: Theme.of(context).textTheme.bodyText2),
                ),
                Card(
                        elevation: 20,
                        margin: EdgeInsets.all(18),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: TransVal.map((e) {
                              return Flexible(
                                  fit: FlexFit.tight,
                                  child: ChartBar(
                                      e, depMax == 0 ? 0.0 : e.amount / depMax));
                            }).toList(),
                          ),
                        ),
                      ),
              ],
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
    );
  }
}
