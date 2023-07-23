// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:login_flutter/logic/cubits/login_cubit.dart';
import 'package:login_flutter/logic/cubits/login_state.dart';
import 'package:login_flutter/presentation/views/loggedin_view.dart';
import 'package:login_flutter/presentation/views/login_error_view.dart';
import 'package:login_flutter/presentation/views/registration_view.dart';
import 'package:login_flutter/presentation/widgets/button_global.dart';
import 'package:login_flutter/presentation/widgets/text_form_global.dart';
import 'package:login_flutter/utils/colors_global.dart';

class LoginView extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status == LoginStatus.success) Get.to(LoggedInView());
        if (state.status == LoginStatus.error) Get.to(LoginErrorView());
      },
      child: Scaffold(
        backgroundColor: GlobalColors.backGroundColor,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      'CULO',
                      style: TextStyle(
                        color: GlobalColors.mainColor,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Login to your account',
                    style: TextStyle(
                      color: GlobalColors.textColor,
                    ),
                  ),
                  const SizedBox(height: 10),
                  BlocBuilder<LoginCubit, LoginState>(
                    builder: (context, state) {
                      return TextFormGlobal(
                        onChanged: (value) {
                          BlocProvider.of<LoginCubit>(context)
                              .emailChanged(value);
                        },
                        controller: usernameController,
                        text: 'Username',
                        textInputType: TextInputType.text,
                        obscured: false,
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  BlocBuilder<LoginCubit, LoginState>(
                    builder: (context, state) {
                      return TextFormGlobal(
                        onChanged: (value) {
                          BlocProvider.of<LoginCubit>(context)
                              .passwordChanged(value);
                        },
                        controller: passwordController,
                        text: 'Password',
                        textInputType: TextInputType.text,
                        obscured: true,
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  BlocBuilder<LoginCubit, LoginState>(
                    builder: (context, state) {
                      return state.status == LoginStatus.submitting
                          ? CircularProgressIndicator()
                          : ButtonGlobal(
                              onPressed: () {
                                BlocProvider.of<LoginCubit>(context)
                                    .loginUser();
                              },
                              text: 'Login',
                            );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: 50,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Don\'t have an account? ',
                style: TextStyle(
                  color: GlobalColors.textColor,
                ),
              ),
              InkWell(
                child: Text(
                  'Sign up!',
                  style: TextStyle(color: GlobalColors.accentColor),
                ),
                onTap: () {
                  Get.to(BlocProvider.value(
                    value: BlocProvider.of<LoginCubit>(context),
                    child: RegistrationView(),
                  ));
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _loginError(BuildContext context) {
    print("metodo chiamato");
    return AlertDialog(
      title: Text(
        'Login failed',
      ),
      content: Text(
        'Error',
      ),
      actions: [
        BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            return TextButton(
              onPressed: () {
                BlocProvider.of<LoginCubit>(context).retry();
                Get.to(LoginView());
              },
              child: Text('Retry'),
            );
          },
        )
      ],
    );
  }
}
