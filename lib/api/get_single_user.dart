import 'dart:convert';

import 'package:http/http.dart' as http;

class GetSingleUser {
  static Future<Map<String, dynamic>> getUserData() async {
    var response = await http.get(Uri.parse('https://reqres.in/api/users/4'));
    if (response.statusCode == 200) {
      var hasil = json.decode(response.body);
      return hasil['data'];
    } else {
      throw Exception('Fetch data is failed');
    }
  }
}
