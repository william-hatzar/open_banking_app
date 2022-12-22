import 'package:flutter/material.dart';
import 'package:open_banking_app/widgets/Title%20Screen.dart';
import 'package:open_banking_app/main.dart';


class BankingView extends StatelessWidget {
  const BankingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text("Account Details", style: TextStyle(color: Colors.black),),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          titleSection
        ],
      ),
    );
  }
}


