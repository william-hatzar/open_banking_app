import 'package:flutter/material.dart';
import 'package:open_banking_app/ForgotPassword.dart';
import 'package:open_banking_app/HomeScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final firstInput = TextEditingController();
  final secondInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: 50.00, height:80.00),
            Padding(padding: const EdgeInsets.all(10),
              child: Container(
                height: 190,
                width: 190,
                padding: const EdgeInsets.only(top: 48.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200),
                ),
                child: const Center(
                  child: Text(
                      "Welcome back",
                      style: TextStyle( color: Colors.blueGrey, fontSize: 40, fontFamily: "Sans-serif", fontWeight: FontWeight.w300)
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: firstInput,
                decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    hintText: 'User Name'
                ),
              ),
            ),
            const Padding(
              padding:  EdgeInsets.all(10),
              child: TextField(
                obscureText: true,
                decoration:  InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    hintText: 'Password'
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
                      color: Colors.black, borderRadius: BorderRadius.circular(0)),
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => BankingView(firstName: firstInput.text)));
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
            Padding(padding: const EdgeInsets.all(10.0),
                child: OutlinedButton(
                  onPressed: (){
                  },
                  child: const Text(
                    'Forgot Password',
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                )
            ),
            Padding(padding: const EdgeInsets.all(10.0),
                child: OutlinedButton(
                  onPressed: (){
                   // TODO New account screen goes here
                  },
                  child: const Text(
                    'New user, create an account here',
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                )
            )
          ],
        )
    );
  }
}
