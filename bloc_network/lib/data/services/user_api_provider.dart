import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/user.dart';

class UserProvider {
  // https://jsonplaceholder.typicode.com/users
  Future<List<User>> getUsers() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      // проверка на запрос удачен или нет
      final List<dynamic> userJson =
          json.decode(response.body); // декодируем пользователей
      return userJson
          .map((json) => User.fromJson(json))
          .toList(); // создание пользователей в map
    } else {
      throw Exception('Error fetching users');
    }
  }
}
