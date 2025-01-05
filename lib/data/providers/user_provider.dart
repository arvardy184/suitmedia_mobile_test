import 'dart:convert';

import 'package:suitmedia_mobile_test/data/models/user_model.dart';
import 'package:http/http.dart' as http;

class UserProvider {
  final String baseUrl = 'https://reqres.in/api/users';

  Future<List<User>> getUsers(int page, int perPage) async{
    final url = Uri.parse('$baseUrl?page=$page&per_page=$perPage');
    final response = await http.get(url);

    if(response.statusCode == 200){
      final data = jsonDecode(response.body);
      final List<dynamic> users = data['data'];
      return users.map((user) => User.fromJson(user)).toList();
  } else {
      throw Exception('Failed to load users');
    }
  }
}