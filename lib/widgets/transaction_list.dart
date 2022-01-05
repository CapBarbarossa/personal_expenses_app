import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({Key? key, required this.txs}) : super(key: key);

  final List<Transaction> txs;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: txs.map((tx) {
        return Card(
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 10.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.purple,
                    width: 1,
                  ),
                ),
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  '\$${tx.amount}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.purple,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tx.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    DateFormat().format(tx.date),
                    style: const TextStyle(
                      fontSize: 13.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              )
            ],
          ),
          elevation: 5,
        );
      }).toList(),
    );
  }
}
