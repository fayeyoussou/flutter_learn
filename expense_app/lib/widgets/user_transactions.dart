import 'package:expense_app/widgets/new_transaction.dart';
import 'package:expense_app/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

import '../models/transaction.dart';
class UserTransaction extends StatefulWidget {
  UserTransaction({Key? key}) : super(key: key);

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 'T1', 
      title: 'Chaussure', 
      amount: 1000, 
      date: DateTime.now()),
    Transaction(
      id: 'T2', 
      title: 'Costume', 
      amount: 2000, 
      date: DateTime.now())
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        New_transaction(),
        TransactionList(_userTransactions)
      ],
    );
  }
}