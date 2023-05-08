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

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (_selectedIndex) {
        case 0 : print("Pressed the Home Button");
      }
    });
  }

  @override
  void initState() {
    super.initState();
    futurePerson = fetchData(widget.name, widget.lastName);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                              elevation: 10.0,
                              margin: const EdgeInsets.only(bottom: 16.0),
                              shape:  RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  side: BorderSide(width: 1, color: Colors.white)),
                              child: Container(
                                decoration: BoxDecoration(image: DecorationImage(
                                  image: AssetImage("assets/images/${(snapshot.data!).bankAccounts[index]
                              .bankAccountName}.png"),
                                  fit: BoxFit.fitWidth,
                                  alignment: Alignment.topCenter
                                )),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
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
                            ),
                          );
                        },
                      ),
                    ),
              ])
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
                ),
              ],
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              selectedItemColor:
              Colors.white,
              elevation: 10,
              unselectedItemColor: Colors.white.withOpacity(
                  0.6),
              type: BottomNavigationBarType
                  .fixed, // set the type to fixed to show all items at once
            )));
  }
}