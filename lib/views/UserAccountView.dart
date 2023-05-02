import 'package:flutter/material.dart';
import 'package:open_banking_app/models/User.dart';
import 'package:open_banking_app/connectors/GetBankAccounts.dart';
import 'package:open_banking_app/views/TransactionsView.dart';

class MyWidget extends StatefulWidget {
  final String name;
  final String lastName;

  const MyWidget({Key? key, required this.name, required this.lastName})
      : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  late Future<User> futurePerson;


  @override
  void initState() {
    super.initState();
    futurePerson = fetchData(widget.name, widget.lastName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<User>(
          future: futurePerson,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 16),
                    Text(
                      (snapshot.data!).name,
                      style: const  TextStyle( color: Colors.blueGrey, fontSize: 24, fontFamily: "Sans-serif", fontWeight: FontWeight.w300),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Bank Accounts:',
                      style:  TextStyle( color: Colors.blueGrey, fontSize: 18, fontFamily: "Sans-serif", fontWeight: FontWeight.w300),
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: ListView.builder(
                        itemCount: (snapshot.data!).bankAccounts.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (_) => TransactionsView(firstName: widget.name, lastName: widget.lastName, bankName:  (snapshot.data!).bankAccounts[index]
                                  .bankAccountName)));
                            },
                            child: Card(
                              elevation: 6.0,
                              margin: const EdgeInsets.only(bottom: 16.0),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      (snapshot.data!).bankAccounts[index]
                                          .bankAccountName,
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      (snapshot.data!).bankAccounts[index]
                                          .accountType,
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      (snapshot.data!).bankAccounts[index]
                                          .accountNumber,
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      (snapshot.data!).bankAccounts[index]
                                          .sortCode,
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}