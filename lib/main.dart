// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:login_flutter/logic/cubits/login_cubit.dart';
import 'package:login_flutter/presentation/views/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(create: (context) => LoginCubit()),
      ],
      child: GetMaterialApp(
        title: 'Flutter Demo',
        home: SplashView(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
