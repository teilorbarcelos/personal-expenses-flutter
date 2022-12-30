import 'dart:ui';

import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double) addTransaction;

  TransactionForm({required this.addTransaction, super.key});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  _submitForm() {
    String text = titleController.text;
    double value = double.tryParse(valueController.text) ?? 0;
    if (text.isEmpty || value <= 0) {
      return;
    }
    widget.addTransaction(
        titleController.text, double.tryParse(valueController.text) ?? 0);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              onSubmitted: (_) => _submitForm(),
              decoration: InputDecoration(labelText: 'Título'),
            ),
            TextField(
                controller: valueController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => _submitForm(),
                decoration: InputDecoration(labelText: 'Valor (R\$)')),
            Container(
              height: 70,
              child: Row(
                children: [
                  Text('Nenhuma data selecionada!'),
                  TextButton(
                    onPressed: () {},
                    child: Text('Selecionar Data',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    onPressed: _submitForm,
                    child: Text(
                      'Nova Transação',
                      style: TextStyle(
                        color: Theme.of(context).textTheme.button?.color,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
