import 'package:flutter/material.dart';
import 'package:open_banking_app/views/UserAccountView.dart';


class BankingView extends StatelessWidget {
  final String firstName;

  const BankingView({Key? key, required this.firstName}) : super(key: key);

  @override
  Widget build(BuildContext context) {

     var firstNameLastName = firstName.split(" ");

     return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.purple,
        title: const Text("Account Details", style: TextStyle(color: Colors.white),),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body:  MyWidget(name: firstNameLastName[0], lastName: firstNameLastName[1])
    );
  }
}


