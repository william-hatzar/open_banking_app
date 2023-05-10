import 'package:flutter/material.dart';
import 'package:open_banking_app/models/User.dart';
import 'package:open_banking_app/connectors/GetBankAccounts.dart';
import 'package:open_banking_app/views/TransactionsView.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

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
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: SafeArea (
                    child : Column (
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 16),
                    Expanded(
                      child: PageView.builder(
                        itemCount: (snapshot.data!).bankAccounts.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              Container(
                                width: 500,
                                height: 250,
                                child: CreditCardWidget(
                                  glassmorphismConfig: false ? Glassmorphism.defaultConfig() : null,
                                  cardNumber: (snapshot.data!).bankAccounts[index].accountNumber,
                                  expiryDate: "03/01/97",
                                  cardHolderName: (snapshot.data!).name,
                                  cvvCode: "123",
                                  bankName: (snapshot.data!).bankAccounts[index]
                                      .bankAccountName,
                                  frontCardBorder: !false ? Border.all(color: Colors.grey) : null,
                                  backCardBorder: !false ? Border.all(color: Colors.grey) : null,
                                  showBackView: false,
                                  onCreditCardWidgetChange: (dummy) { },
                                  customCardTypeIcons: <CustomCardTypeIcon>[
                                    CustomCardTypeIcon(
                                      cardType: CardType.visa,
                                      cardImage: Image.asset(
                                        'assets/mastercard.png',
                                        height: 48,
                                        width: 48,
                                      ),
                                    ),
                                  ],
                                  obscureCardNumber: true,
                                  obscureCardCvv: true,
                                  isHolderNameVisible: true,
                                  cardBgColor: Color(0xff363636),
                                  backgroundImage: true ? 'assets/card/card_bg.png' : null ,
                                  //true when you want to show cvv(back) view
                                ),
                              ),
                              Expanded(child: TransactionsView(firstName: widget.name, lastName: widget.lastName, bankName: (snapshot.data!).bankAccounts[index]
                                  .bankAccountName))
                            ],
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 8.0)

              ])
              ));
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
              Colors.black, // set the background color to white
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