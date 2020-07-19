import "package:flutter/material.dart";
import "./newTransaction.dart";
import "./transactionList.dart";
import "../models/transactions.dart";

class UersTransactions extends StatefulWidget {
  @override
  _UersTransactionsState createState() => _UersTransactionsState();
}

class _UersTransactionsState extends State<UersTransactions> {
  final List<Transaction> _transactions = [];
  void _addNewTransaction(String title, double amount) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: DateTime.now());
    setState(() {
      _transactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        TransactionList(_transactions),
      ],
    );
  }
}
