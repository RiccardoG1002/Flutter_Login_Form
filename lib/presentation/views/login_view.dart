// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_flutter/presentation/views/registration_view.dart';
import 'package:login_flutter/presentation/widgets/button_global.dart';
import 'package:login_flutter/presentation/widgets/text_form_global.dart';
import 'package:login_flutter/utils/colors_global.dart';

class LoginView extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              TextFormGlobal(
                controller: emailController,
                text: 'Email',
                textInputType: TextInputType.emailAddress,
                obscured: false,
              ),
              const SizedBox(height: 10),
              TextFormGlobal(
                controller: passwordController,
                text: 'Password',
                textInputType: TextInputType.text,
                obscured: true,
              ),
              const SizedBox(height: 10),
              const ButtonGlobal(text: 'Login'),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
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
                Get.to(RegistrationView());
              },
            )
          ],
        ),
      ),
    );
  }
}
