import 'package:flutter/material.dart';
import 'package:personal_expenses_app/widgets/chart_bar.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  const Chart({Key? key, required this.recentTxs}) : super(key: key);

  final List<Transaction> recentTxs;

  List<Map<String, Object>> get groupedTxs {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0;

      for (var i = 0; i < recentTxs.length; i++) {
        if (recentTxs[i].date.day == weekDay.day &&
            recentTxs[i].date.month == weekDay.month &&
            recentTxs[i].date.year == weekDay.year) {
          totalSum += recentTxs[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTxs.fold(0.0, (previousValue, element) {
      return previousValue + (element['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTxs.map((e) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                label: e['day'].toString(),
                spendingAmt: (e['amount'] as double),
                spendingperc: totalSpending == 0.0
                    ? 0.0
                    : (e['amount'] as double) / totalSpending,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
