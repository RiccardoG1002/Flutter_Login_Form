import 'package:flutter/material.dart';
import 'package:login_flutter/utils/colors_global.dart';

class ButtonGlobal extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;

  const ButtonGlobal({super.key, this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: Container(
        alignment: Alignment.center,
        height: 50,
        decoration: BoxDecoration(
          color: GlobalColors.mainColor,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: GlobalColors.textColor,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
      ),
    );
  }
}
