import 'package:flutter/material.dart';
import 'package:login_flutter/utils/colors_global.dart';

class LoggedInView extends StatelessWidget {
  const LoggedInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.backGroundColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              // ignore: prefer_const_constructors
              child: Text(
                "CULOOOOOO",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  height: 80,
                  color: GlobalColors.mainColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
