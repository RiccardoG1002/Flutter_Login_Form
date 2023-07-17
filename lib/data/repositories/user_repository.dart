import 'package:login_flutter/data/data_providers/user_provider.dart';

class UserRepository {
  final UserProvider userProvider = UserProvider();

  Future<void> loginUser(String email, String password) async {
    await userProvider.loginUser(email, password);
  }
}
