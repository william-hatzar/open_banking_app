import 'package:flutter/material.dart';
import 'package:open_banking_app/Verified.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  final emailInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(width: 50.00, height:80.00),
          Padding(padding: const EdgeInsets.all(10),
            child: Container(
              height: 300,
              width: 300,
              padding: const EdgeInsets.only(top: 48.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),
              ),
              child: const Center(
                child: Text(
                    "Enter your email",
                    style: TextStyle( color: Colors.blueGrey, fontSize: 40, fontFamily: "Sans-serif", fontWeight: FontWeight.w300)
                ),
              ),
            ),
          ),
           Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: emailInput,
              decoration:  const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: 'Email'
              ),
            ),
          ),
          Padding(padding: const EdgeInsets.all(10.0),
            child: Row(children: [
              Expanded(child:
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.purple, borderRadius: BorderRadius.circular(0)),
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => VerifiedScreen(email: emailInput.text)));
                  },
                  child: const Text(
                    'Continue',
                    style: TextStyle(color: Colors.white, fontSize: 15 ),
                  ),
                ),
              )
              )
            ],),
          ),
        ],
      )
    );
  }
}
