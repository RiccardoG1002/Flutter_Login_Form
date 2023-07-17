// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_flutter/presentation/views/login_view.dart';
import 'package:login_flutter/utils/colors_global.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Get.to(LoginView());
    });
    return Scaffold(
      backgroundColor: GlobalColors.backGroundColor,
      body: Center(
        child: Text(
          'CULO',
          style: TextStyle(
            letterSpacing: 3,
            color: GlobalColors.mainColor,
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
