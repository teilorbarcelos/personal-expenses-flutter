import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expences/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final dynamic Function(String) onRemove;

  const TransactionList(
      {required this.transactions, required this.onRemove, super.key});

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) => Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Nenhuma Transação Cadastrada!',
                  style: Theme.of(context).appBarTheme.toolbarTextStyle,
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          )
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              final transactionItem = transactions[index];
              return Card(
                elevation: 5,
                margin: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text('R\$ ${transactionItem.value}'),
                        ),
                      ),
                    ),
                    title: Text(transactionItem.title,
                        style: Theme.of(context).appBarTheme.toolbarTextStyle),
                    subtitle: Text(
                        DateFormat('d MMM y').format(transactionItem.date)),
                    trailing: MediaQuery.of(context).size.width > 480
                        ? TextButton.icon(
                            onPressed: () => onRemove(transactionItem.id),
                            icon: const Icon(Icons.delete),
                            label: Text('Excluir'),
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Theme.of(context).errorColor),
                            ),
                          )
                        : IconButton(
                            onPressed: () => onRemove(transactionItem.id),
                            icon: const Icon(Icons.delete),
                            color: Theme.of(context).errorColor,
                          )),
              );
            },
          );
  }
}
