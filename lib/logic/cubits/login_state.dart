// ignore_for_file: prefer_const_constructors

import 'package:equatable/equatable.dart';

enum LoginStatus { initial, submitting, success, error }

class LoginState extends Equatable {
  final String email;
  final String password;
  final LoginStatus status;

  const LoginState(
      {required this.email, required this.password, required this.status});

  bool get isFormaValid => email.isNotEmpty && password.isNotEmpty;

  factory LoginState.initial() {
    return LoginState(email: '', password: '', status: LoginStatus.initial);
  }

  @override
  List<Object?> get props => [email, password, status];

  @override
  bool get stringify => true;

  LoginState copyWith({String? email, String? password, LoginStatus? status}) {
    return LoginState(
        email: email ?? this.email,
        password: password ?? this.password,
        status: status ?? this.status);
  }
}
