import 'package:flutter/material.dart';
import 'package:login_flutter/utils/colors_global.dart';

class LoggedInView extends StatelessWidget {
  const LoggedInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.backGroundColor,
      body: SingleChildScrollView(
        child: Container(
          // ignore: prefer_const_constructors
          child: Text(
            "CIAOOOOOO",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                height: 50,
                color: GlobalColors.mainColor),
          ),
        ),
      ),
    );
  }
}
