import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expences/components/chart_bar.dart';
import 'package:personal_expences/models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double daySum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        bool sameDay = recentTransactions[i].date.day == weekDay.day;
        bool sameMonth = recentTransactions[i].date.month == weekDay.month;
        bool sameYear = recentTransactions[i].date.year == weekDay.year;

        if (sameDay && sameMonth && sameYear) {
          daySum += recentTransactions[i].value;
        }
      }

      return {'day': DateFormat.E().format(weekDay)[0], 'value': daySum};
    }).reversed.toList();
  }

  const Chart({required this.recentTransactions, super.key});

  double get _weekTotalValue {
    return groupedTransactions.fold(
        0.0, (total, currentItem) => total + (currentItem['value'] as double));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 6,
        margin: EdgeInsets.all(20),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedTransactions.map((transaction) {
              return Flexible(
                fit: FlexFit.loose,
                child: ChartBar(
                    label: transaction['day'] as String,
                    percentage:
                        _weekTotalValue != 0 ? (transaction['value'] as double) / _weekTotalValue : 0,
                    dayValue: transaction['value'] as double),
              );
            }).toList(),
          ),
        ));
  }
}
