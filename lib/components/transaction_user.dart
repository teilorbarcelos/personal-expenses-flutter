import 'package:flutter/material.dart';
import 'package:personal_expences/components/transaction_form.dart';
import 'package:personal_expences/components/transaction_list.dart';
import 'package:personal_expences/models/transaction.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({super.key});

  @override
  State<TransactionUser> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<TransactionUser> {
  final _transactions = [
    Transaction(
        id: 't1', title: 'Aluguel', value: 1109.37, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Condomínio', value: 359.25, date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionList(transactions: _transactions),
        TransactionForm()
      ],
    );
  }
}