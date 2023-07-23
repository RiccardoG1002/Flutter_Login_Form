import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:login_flutter/data/data_providers/auth_interceptor.dart';

class UserProvider {
  final AuthInterceptor authInterceptor = AuthInterceptor(inner: http.Client());
  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': '*/*',
  };

  Future<void> loginUser(String email, String password) async {
    final Map<String, dynamic> body = {
      'username': email,
      'password': password,
    };
    final response = await http.post(
        Uri.parse("http://localhost:9191/api/v1/auth/authenticate"),
        body: jsonEncode(body),
        headers: headers);
    if (response.statusCode == 200) {
      final String token = jsonDecode(response.body)['token'];
      authInterceptor.setToken(token);
    } else {
      throw Exception("Login failed");
    }
  }

  Future<void> registerUser(
      String username, String email, String password) async {}
}
