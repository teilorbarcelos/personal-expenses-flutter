import 'dart:math';

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
        id: 't2', title: 'Condomínio', value: 359.25, date: DateTime.now()),
    Transaction(
        id: 't3', title: '#01', value: 359.25, date: DateTime.now()),
    Transaction(
        id: 't4', title: '#02', value: 359.25, date: DateTime.now()),
    Transaction(
        id: 't5', title: '#03', value: 359.25, date: DateTime.now()),
    Transaction(
        id: 't6', title: '#04', value: 359.25, date: DateTime.now()),
    Transaction(
        id: 't7', title: '#05', value: 359.25, date: DateTime.now()),
    Transaction(
        id: 't8', title: '#06', value: 359.25, date: DateTime.now()),
    Transaction(
        id: 't9', title: '#07', value: 359.25, date: DateTime.now()),
    Transaction(
        id: 't10', title: '#08', value: 359.25, date: DateTime.now()),
    Transaction(
        id: 't11', title: '#09', value: 359.25, date: DateTime.now()),
    Transaction(
        id: 't12', title: '#10', value: 359.25, date: DateTime.now()),
    Transaction(
        id: 't13', title: '#11', value: 359.25, date: DateTime.now())
  ];

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
        id: Random().nextDouble().toString(),
        title: title,
        value: value,
        date: DateTime.now());

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionForm(addTransaction: _addTransaction),
        TransactionList(transactions: _transactions),
      ],
    );
  }
}
