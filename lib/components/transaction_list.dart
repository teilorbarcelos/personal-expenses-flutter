import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expences/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList({required this.transactions, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions.map((transactionItem) {
        return Card(
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.purple, width: 2)),
                padding: EdgeInsets.all(10),
                child: Text(
                  'R\$ ${transactionItem.value.toStringAsFixed(2)}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.purple),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transactionItem.title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    DateFormat('dd/MM/yyyy').format(transactionItem.date),
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              )
            ],
          ),
        );
      }).toList(),
    );
  }
}
