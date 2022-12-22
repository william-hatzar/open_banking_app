import 'package:flutter/material.dart';
import 'package:open_banking_app/HomeScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _searchController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
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
                      style: TextStyle( color: Colors.black, fontSize: 40, fontFamily: "Sans-serif", fontWeight: FontWeight.w500)
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: _searchController,
                decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    hintText: 'User Name'
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
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
                      color: Colors.purple, borderRadius: BorderRadius.circular(0)),
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => BankingView( )));
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
                    //TODO FORGOT PASSWORD SCREEN GOES HERE
                  },
                  child: const Text(
                    'Forgot Password',
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                )
            ),
            const Padding(padding: EdgeInsets.all(10.00),
                child:  Text('New User? Create Account'))
          ],
        )
    );
  }
}
