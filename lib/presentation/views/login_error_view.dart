import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:login_flutter/logic/cubits/login_cubit.dart';
import 'package:login_flutter/presentation/views/login_view.dart';
import 'package:login_flutter/utils/colors_global.dart';

class LoginErrorView extends StatelessWidget {
  const LoginErrorView({super.key});

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
              child: ElevatedButton(
                onPressed: () {
                  BlocProvider.of<LoginCubit>(context).retry();
                  Get.to(LoginView());
                },
                child: const Text('Retry'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
