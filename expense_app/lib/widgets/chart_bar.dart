import 'package:expense_app/models/chartVal.dart';
import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  // const ChartBar({Key? key}) : super(key: key);
  final ChartValue chart;
  // final String day;
  final double spendpourcentage;
  ChartBar(this.chart, this.spendpourcentage);
  @override
  Widget build(BuildContext context) {
    // return Text(chart.toString()+'/ '+day+'/ '+spendpourcentage.toString() );
    return Column(
      children: [
        FittedBox(child: Text('${((chart.amount)/1000).toStringAsFixed(1)}k')),
        SizedBox(height: 4),
        Container(
            height: 60,
            width: 10,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 0.7),
                      color: Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(10)),
                ),
                FractionallySizedBox(
                  heightFactor: spendpourcentage,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10)
                      ),
                  ),)
              ],
            )),
        SizedBox(
          height: 4,
        ),
        Text(chart.day)
      ],
    );
  }
}
