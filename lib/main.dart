import 'package:flutter/material.dart';
import 'package:personal_expences/models/transaction.dart';

void main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final _transactions = [
    Transaction(
        id: 't1', title: 'Aluguel', value: 1109.37, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Condomínio', value: 359.25, date: DateTime.now())
  ];

  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Despesas Pessoais'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              child: Card(
                color: Colors.blue,
                child: Text('Gráfico'),
                elevation: 5,
              ),
            ),
            Column(
              children: _transactions.map((transactionItem) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        child: Text(transactionItem.value.toString()),
                      ),
                      Column(
                        children: [
                          Text(transactionItem.title),
                          Text(transactionItem.date.toString())
                        ],
                      )
                    ],
                  ),
                );
              }).toList(),
            )
          ],
        ));
  }
}
