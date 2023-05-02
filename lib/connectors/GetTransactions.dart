import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:open_banking_app/models/Transactions.dart';

Future<Transactions> fetchData(String firstName, String lastName, String filterByBank) async {
  final response = await
  http.get(Uri.parse(
      'http://localhost:9001/getUserTransactions?firstName=$firstName&lastName=$lastName&filterByBank=$filterByBank'
  ));

  if (response.statusCode == 200) {
    return Transactions.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load data');
  }
}