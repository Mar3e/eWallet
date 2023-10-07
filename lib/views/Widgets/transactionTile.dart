import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../Models/transaction.dart';

class TransactionTile extends StatelessWidget {
  final Transaction transaction;
  const TransactionTile({
    super.key,
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        radius: 23.0,
        backgroundImage: AssetImage("assets/images/avatar.png"),
      ),
      title: Text(
        transaction.receiver,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        DateFormat.yMEd().format(transaction.timeStamp),
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
      trailing: Text(
        '\$${transaction.amount.toString()}',
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
