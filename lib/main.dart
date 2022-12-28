import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:personal_expences/components/transaction_form.dart';
import 'package:personal_expences/components/transaction_list.dart';
import 'package:personal_expences/models/transaction.dart';

void main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
          primarySwatch: Colors.purple,
          colorScheme: ColorScheme.light(secondary: Colors.amber),
          fontFamily: 'Quicksand',
          appBarTheme: AppBarTheme(
            toolbarTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ))),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [
    // Transaction(
    //     id: 't1', title: 'Aluguel', value: 1109.37, date: DateTime.now()),
    // Transaction(
    //     id: 't2', title: 'Condomínio', value: 359.25, date: DateTime.now()),
    // Transaction(id: 't3', title: '#01', value: 359.25, date: DateTime.now()),
    // Transaction(id: 't4', title: '#02', value: 359.25, date: DateTime.now()),
    // Transaction(id: 't5', title: '#03', value: 359.25, date: DateTime.now()),
    // Transaction(id: 't6', title: '#04', value: 359.25, date: DateTime.now()),
    // Transaction(id: 't7', title: '#05', value: 359.25, date: DateTime.now()),
    // Transaction(id: 't8', title: '#06', value: 359.25, date: DateTime.now()),
    // Transaction(id: 't9', title: '#07', value: 359.25, date: DateTime.now()),
    // Transaction(id: 't10', title: '#08', value: 359.25, date: DateTime.now()),
    // Transaction(id: 't11', title: '#09', value: 359.25, date: DateTime.now()),
    // Transaction(id: 't12', title: '#10', value: 359.25, date: DateTime.now()),
    // Transaction(id: 't13', title: '#11', value: 359.25, date: DateTime.now())
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

    Navigator.of(context).pop();
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionForm(addTransaction: _addTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Despesas Pessoais',
          style: Theme.of(context).appBarTheme.toolbarTextStyle,
        ),
        actions: [
          IconButton(
              onPressed: () => _openTransactionFormModal(context),
              icon: Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              child: Card(
                color: Colors.blue,
                child: Text('Gráfico'),
                elevation: 5,
              ),
            ),
            TransactionList(transactions: _transactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _openTransactionFormModal(context)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
