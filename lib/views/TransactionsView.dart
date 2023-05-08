import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_banking_app/connectors/GetTransactions.dart';
import 'package:open_banking_app/models/Transactions.dart';

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

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (_selectedIndex) {
        case 0:
          print("Pressed the Home Button");
      }
    });
  }

  @override
  void initState() {
    super.initState();
    futureTransactions =
        fetchData(widget.firstName, widget.lastName, widget.bankName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.purple,
          title: const Text(
            "Transactions",
            style: TextStyle(color: Colors.white),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
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
                              onTap: () {},
                              child: Card(
                                elevation: 4.0,
                                margin: const EdgeInsets.only(bottom: 16.0),
                                  shape:  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      side: BorderSide(width: 5, color: Colors.white)),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        (snapshot.data!)
                                            .transactionsList[index]
                                            .name,
                                        style: const TextStyle(fontSize: 18),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        "£${(snapshot.data!).transactionsList[index].price}",
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        (snapshot.data!)
                                            .transactionsList[index]
                                            .category,
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      const SizedBox(height: 8)
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
        bottomNavigationBar: BottomNavigationBarTheme(
            data: BottomNavigationBarThemeData(
              backgroundColor:
                  Colors.purple, // set the background color to white
              selectedItemColor:
                  Colors.white, // set the selected item color to purple
              unselectedItemColor: Colors.white.withOpacity(
                  0.6), // set the unselected item color to a lighter shade of purple
              selectedIconTheme: const IconThemeData(
                  color:
                      Colors.white), // set the selected icon color to purple
              unselectedIconTheme: IconThemeData(
                  color: Colors.white.withOpacity(
                      0.6)), // set the unselected icon color to a lighter shade of purple
              showSelectedLabels: true, // show the label of the selected item
              showUnselectedLabels:
                  true, // show the label of the unselected items
              type: BottomNavigationBarType
                  .fixed, // set the type to fixed to show all items at once
              // set the shape to provide an outline around the bottom navigation bar
            ),
            child: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.summarize),
                  label: 'Summary',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.payment),
                  label: 'Pay',
                )
              ],
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              selectedItemColor:
                  Colors.white,
              unselectedItemColor: Colors.white.withOpacity(
                  0.6),
              type: BottomNavigationBarType
                  .fixed, // set the type to fixed to show all items at once
            )));
  }
}
