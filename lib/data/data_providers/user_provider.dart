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
      'email': email,
      'password': password,
    };
    final response = await authInterceptor.post(
        Uri.parse("http://localhost:9191/api/v1/auth"),
        body: body,
        headers: headers);
    if (response.statusCode == 200) {
      final String token = jsonDecode(response.body)['token'];
      authInterceptor.setToken(token);
    }
  }
}
