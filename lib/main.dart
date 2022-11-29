import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matgar/shared/bloc_observer.dart';
import 'package:matgar/shared/cubit/cubit.dart';
import 'package:matgar/shared/cubit/states.dart';
import 'package:matgar/shared/network/remote/dio_helper.dart';
import 'package:matgar/shared/themes.dart';
import 'package:matgar/splash_screen.dart';
import 'package:matgar/test_screen.dart';
import 'modules/onboarding/onboarding_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  WidgetsFlutterBinding.ensureInitialized();

  //await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (BuildContext context) => ShopCubit()..getCategoryData()),
      ],
      child: BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {},
        builder: (context, state) => ScreenUtilInit(
          builder: (context, child) {
            return MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: myTheme(),
              home: SplashScreen(),
              //  home: const TestScreen(),
            );
          },
        ),
      ),
    );
  }
}
