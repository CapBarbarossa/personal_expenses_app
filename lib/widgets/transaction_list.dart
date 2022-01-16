import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({Key? key, required this.txs, required this.deleteTx})
      : super(key: key);

  final List<Transaction> txs;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600.0,
      child: txs.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 200.00,
                  margin: const EdgeInsets.symmetric(vertical: 18.0),
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.contain,
                  ),
                ),
                Text(
                  'No transactions added yet!',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 5),
                  elevation: 5,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30.0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FittedBox(
                          child: Text('\$${txs[index].amount}'),
                        ),
                      ),
                    ),
                    title: Text(
                      txs[index].title,
                      style: Theme.of(ctx).textTheme.headline1,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(txs[index].date),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () {
                        deleteTx(txs[index].id);
                      },
                    ),
                  ),
                );
              },
              itemCount: txs.length,
            ),
    );
  }
}
