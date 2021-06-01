import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String name;
  final double amount;
  final double amountPercentage;

  ChartBar(this.name, this.amount, this.amountPercentage);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: 20,
            child: FittedBox(
              child: Text('\$${amount.toStringAsFixed(0)}'),
            ),
          ),
          SizedBox(height: 3),
          Container(
            height: 60,
            width: 10,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 1.0,
                    ),
                    color: Colors.lightGreenAccent,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: amountPercentage,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 3),
          Text(name),
        ],
      ),
    );
  }
}
