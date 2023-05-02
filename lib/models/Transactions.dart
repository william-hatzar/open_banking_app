 class Transactions {
  final String name;
  final List<TransactionsList> transactionsList;

  Transactions({required this.name, required this.transactionsList});

  factory Transactions.fromJson(Map<String, dynamic> json) {
  var transactionsList = json['transactions'] as List<dynamic>;
  List<TransactionsList> transactions =
  transactionsList.map((i) => TransactionsList.fromJson(i)).toList();
  return Transactions(
  name: json['name'],
  transactionsList: transactions,
  );
  }
  }

class TransactionsList {
  final String name;
  final String price;
  final String category;
  final bool cleared;
  final String bankName;

  TransactionsList(
      {required this.name,
        required this.price,
        required this.category,
        required this.cleared,
        required this.bankName});

  factory TransactionsList.fromJson(Map<String, dynamic> json) {
    return TransactionsList(
      name: json['name'],
      price: json['price'],
      category: json['category'],
      cleared: json['cleared'],
      bankName: json['bankName'],
    );
  }
}