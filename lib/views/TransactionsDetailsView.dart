import 'package:flutter/material.dart';

class TransactionsDetailsView extends StatefulWidget {
  final String company;
  final String bankName;
  final String price;

  const TransactionsDetailsView(
      {Key? key,
      required this.bankName,
      required this.company,
      required this.price})
      : super(key: key);

  @override
  State<TransactionsDetailsView> createState() =>
      _TransactionsDetailsViewState();
}

class _TransactionsDetailsViewState extends State<TransactionsDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Transaction Details"), backgroundColor: Colors.black),
        body: Center(
            child: Column(
          children: [
            Text(widget.bankName),
            Text(widget.company),
            Text(widget.price)
          ],
        )));
  }
}
