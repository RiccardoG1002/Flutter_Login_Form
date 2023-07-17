import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_flutter/data/repositories/user_repository.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final UserRepository userRepository = UserRepository();

  LoginCubit() : super(LoginState.initial());

  void emailChanged(String value) {
    emit(state.copyWith(email: value, status: LoginStatus.initial));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: value, status: LoginStatus.initial));
  }

  Future<void> loginUser() async {
    if (state.status == LoginStatus.submitting) return;
    emit(state.copyWith(status: LoginStatus.submitting));
    await userRepository.loginUser(state.email, state.password);
    emit(state.copyWith(status: LoginStatus.success));
    return;
  }
}
