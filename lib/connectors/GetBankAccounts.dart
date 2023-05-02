import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:open_banking_app/models/User.dart';


Future<User> fetchData(String firstName, String lastName) async {
  final response = await http.get(Uri.parse('http://localhost:9001/getUserAccounts?firstName=$firstName&lastName=$lastName'));

  if (response.statusCode == 200) {

    return User.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load data');
  }
}