// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:login_flutter/logic/cubits/login_cubit.dart';
import 'package:login_flutter/logic/cubits/login_state.dart';
import 'package:login_flutter/presentation/views/loggedin_view.dart';
import 'package:login_flutter/presentation/widgets/button_global.dart';
import 'package:login_flutter/presentation/widgets/text_form_global.dart';
import 'package:login_flutter/utils/colors_global.dart';

class RegistrationView extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  RegistrationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status == LoginStatus.success) Get.to(LoggedInView());
      },
      child: Scaffold(
        backgroundColor: GlobalColors.backGroundColor,
        body: SafeArea(
          child: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                const SizedBox(height: 20),
                Text(
                  'CULO',
                  style: TextStyle(
                    color: GlobalColors.mainColor,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
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
                            .usernameChanged(value);
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
                            .emailChanged(value);
                      },
                      controller: emailController,
                      text: 'Email',
                      textInputType: TextInputType.emailAddress,
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
                    return ButtonGlobal(
                      onPressed: () {
                        BlocProvider.of<LoginCubit>(context).registerUser();
                      },
                      text: 'Sign in',
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
