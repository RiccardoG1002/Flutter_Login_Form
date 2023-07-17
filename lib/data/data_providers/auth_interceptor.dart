import 'dart:convert';

import 'dart:typed_data';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AuthInterceptor implements http.BaseClient {
  final http.Client inner;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  AuthInterceptor({required this.inner});

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    final jwt = await _storage.read(key: 'jwt');
    request.headers['Authorization'] = 'Bearer $jwt';
    return inner.send(request);
  }

  Future<void> setToken(String token) async {
    await _storage.write(key: 'jwt', value: token);
  }

  @override
  void close() {
    // TODO: implement close
  }

  @override
  Future<http.Response> delete(Uri url,
      {Map<String, String>? headers, Object? body, Encoding? encoding}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<http.Response> get(Uri url, {Map<String, String>? headers}) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<http.Response> head(Uri url, {Map<String, String>? headers}) {
    // TODO: implement head
    throw UnimplementedError();
  }

  @override
  Future<http.Response> patch(Uri url,
      {Map<String, String>? headers, Object? body, Encoding? encoding}) {
    // TODO: implement patch
    throw UnimplementedError();
  }

  @override
  Future<http.Response> post(Uri url,
      {Map<String, String>? headers, Object? body, Encoding? encoding}) {
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  Future<http.Response> put(Uri url,
      {Map<String, String>? headers, Object? body, Encoding? encoding}) {
    // TODO: implement put
    throw UnimplementedError();
  }

  @override
  Future<String> read(Uri url, {Map<String, String>? headers}) {
    // TODO: implement read
    throw UnimplementedError();
  }

  @override
  Future<Uint8List> readBytes(Uri url, {Map<String, String>? headers}) {
    // TODO: implement readBytes
    throw UnimplementedError();
  }
}

// Usage:
/*final client = http.Client();
final authClient = AuthInterceptor(client);
final response = await authClient.get(Uri.parse('http://example.com/api'));*/
