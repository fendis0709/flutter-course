import 'package:flutter/material.dart';
import 'package:flutter_personal_expense_app/models/transaction.dart';
import 'package:flutter_personal_expense_app/widgets/chart_bar.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  Chart(this.transactions);

  final List<Transaction> transactions;

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final currentDay = DateTime.now().subtract(
        Duration(
          days: index,
        ),
      );

      double totalAmount = 0;
      for (var i = 0; i < transactions.length; i++) {
        if (transactions[i].date.day == currentDay.day &&
            transactions[i].date.month == currentDay.month &&
            transactions[i].date.year == currentDay.year) {
          totalAmount += transactions[i].amount;
        }
      }

      return {
        'day': DateFormat('EEE').format(currentDay),
        'amount': totalAmount,
      };
    }).reversed.toList();
  }

  double get totalAmount {
    return groupedTransactionValues.fold(0.0, (previousValue, transaction) {
      return previousValue + transaction['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(15),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.map((data) {
            print('${data['day']}: ${data['amount']}');
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                data['day'],
                data['amount'],
                (totalAmount > 0
                    ? (data['amount'] as double) / totalAmount
                    : 0),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
