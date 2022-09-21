import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:matgar/shared/bloc_observer.dart';
import 'package:matgar/shared/network/remote/dio_helper.dart';
import 'package:matgar/shared/themes.dart';
import 'modules/onboarding/onboarding_screen.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  //await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: myTheme(),
      home: const OnBoardingScreen(),
    );
  }
}
