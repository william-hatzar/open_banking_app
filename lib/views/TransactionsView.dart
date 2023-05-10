import 'package:flutter/material.dart';
import 'package:open_banking_app/connectors/GetTransactions.dart';
import 'package:open_banking_app/models/Transactions.dart';
import 'package:open_banking_app/views/TransactionsDetailsView.dart';

class TransactionsView extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String bankName;

  const TransactionsView(
      {Key? key,
      required this.firstName,
      required this.lastName,
      required this.bankName})
      : super(key: key);

  @override
  State<TransactionsView> createState() => _TransactionsViewState();
}

class _TransactionsViewState extends State<TransactionsView> {
  late Future<Transactions> futureTransactions;

  @override
  void initState() {
    super.initState();
    futureTransactions =
        fetchData(widget.firstName, widget.lastName, widget.bankName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<Transactions>(
          future: futureTransactions,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 16),
                    Expanded(
                      child: ListView.builder(
                        itemCount: (snapshot.data!).transactionsList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => TransactionsDetailsView(
                                          bankName: (snapshot.data!)
                                              .transactionsList[index]
                                              .bankName,
                                          company: (snapshot.data!)
                                              .transactionsList[index]
                                              .name,
                                          price: (snapshot.data!)
                                              .transactionsList[index]
                                              .price)));
                            },
                            child: Card(
                              elevation: 4.0,
                              margin: const EdgeInsets.only(bottom: 16.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                side: const BorderSide(
                                  width: 5,
                                  color: Colors.white,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          (snapshot.data!)
                                              .transactionsList[index]
                                              .name,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "£${(snapshot.data!).transactionsList[index].price}",
                                          style: const TextStyle(
                                            fontSize: 18,
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 12),
                                    Text(
                                      (snapshot.data!)
                                          .transactionsList[index]
                                          .category,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    Row(
                                      children: const [
                                        Icon(
                                          Icons.location_on,
                                          size: 16,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(width: 4),
                                        Text(
                                          "London",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 12),
                                    Row(
                                      children: const [
                                         Icon(
                                          Icons.credit_card,
                                          size: 16,
                                          color: Colors.grey,
                                        ),
                                         SizedBox(width: 4),
                                        Text(
                                          "**** **** **** 123",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
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
              return const Center(
                  child: Text("No transactions to display",
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 30,
                          fontFamily: "Sans-serif",
                          fontWeight: FontWeight.w300)));
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
