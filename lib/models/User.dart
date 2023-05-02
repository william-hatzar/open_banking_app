class User {
  final String name;
  final List<BankAccount> bankAccounts;

  User({required this.name, required this.bankAccounts});

  factory User.fromJson(Map<String, dynamic> json) {
    var bankAccountsList = json['bankAccounts'] as List<dynamic>;
    List<BankAccount> bankAccounts =
    bankAccountsList.map((i) => BankAccount.fromJson(i)).toList();
    return User(
      name: json['name'],
      bankAccounts: bankAccounts,
    );
  }
}

class BankAccount {
  final String bankAccountName;
  final String accountType;
  final String accountNumber;
  final String sortCode;

  BankAccount(
      {required this.bankAccountName,
        required this.accountType,
        required this.accountNumber,
        required this.sortCode});

  factory BankAccount.fromJson(Map<String, dynamic> json) {
    return BankAccount(
      bankAccountName: json['bankAccountName'],
      accountType: json['accountType'],
      accountNumber: json['accountNumber'],
      sortCode: json['sortCode'],
    );
  }
}