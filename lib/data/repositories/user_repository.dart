import 'package:login_flutter/data/data_providers/user_provider.dart';

class UserRepository {
  final UserProvider userProvider = UserProvider();

  Future<void> loginUser(String email, String password) async {
    try {
      await userProvider.loginUser(email, password);
    } catch (e) {
      throw Exception();
    }
  }

  Future<void> registerUser(
      String username, String email, String password) async {
    String token = await userProvider.registerUser(username, email, password);
    await userProvider.confirmRegistration(token);
  }
}
