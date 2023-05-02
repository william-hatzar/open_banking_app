import "package:flutter/material.dart";
import 'package:open_banking_app/LoginScreen.dart';

class VerifiedScreen extends StatefulWidget {
  final String email;
  const VerifiedScreen({Key? key, required this.email}) : super(key: key);

  @override
  State<VerifiedScreen> createState() => _VerifiedScreenState();
}

class _VerifiedScreenState extends State<VerifiedScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          const SizedBox(width: 50.00, height:200.00),
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
                    "An email has been sent to:",
                    style: TextStyle( color: Colors.blueGrey, fontSize: 40, fontFamily: "Sans-serif", fontWeight: FontWeight.w300)
                ),
              ),
            ),
          ),
          Container(
              height: 250,
              width: 300,
              padding: const EdgeInsets.only(top: 20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),
              ),
                child: Text(
                    widget.email,
                    style: const TextStyle( color: Colors.blueGrey, fontSize: 20, fontFamily: "Sans-serif", fontWeight: FontWeight.w300)
                ),
              ),
          Container( child :
              Padding(padding: const EdgeInsets.all(10.0),
                  child: OutlinedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginScreen()));
                    },
                    child: const Text(
                      'Back to login',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  )
              )
          ),
        ],
      ),
    );
  }
}



