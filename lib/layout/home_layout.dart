// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../shared/cubit/cubit.dart';
import '../shared/cubit/states.dart';
import '../shared/styles/icon_broken.dart';

class ShopLayoutScreen extends StatelessWidget {
  const ShopLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) {
          return ShopCubit();
        },
        child: BlocConsumer<ShopCubit, ShopStates>(
            listener: (BuildContext context, Object? state) {},
            builder: (BuildContext context, Object? state) {
              var cubit = ShopCubit.get(context);

              return Directionality(
                textDirection: TextDirection.rtl,
                child: Scaffold(
                  appBar: PreferredSize(
                    preferredSize:
                        const Size.fromHeight(55.0), // here the desired height

                    child: AppBar(
                      title: Column(
                        children: const [
                          Center(
                            child: Text(
                              'متجر بيع المواشي',
                            ),
                          )
                        ],
                      ),
                      actions: [
                        const Icon(
                          IconBroken.Search,
                          size: 25,
                        ),
                        Container(
                            margin: const EdgeInsets.only(left: 10, right: 30),
                            child: const Icon(
                              IconBroken.Notification,
                              size: 25,
                            )),
                      ],
                    ),
                  ),
                  body: cubit
                      .chooseBotNavBarScreen(cubit.bottomNavBarCurrentIndex),
                  bottomNavigationBar: GNav(
                    rippleColor: Colors.grey[300]!,
                    hoverColor: Colors.grey[100]!,
                    gap: 8,
                    activeColor: Colors.black,
                    iconSize: 24,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    duration: const Duration(milliseconds: 400),
                    tabBackgroundColor: Colors.grey[100]!,
                    color: Colors.black,
                    selectedIndex: cubit.bottomNavBarCurrentIndex,
                    onTabChange: (int i) {
                      cubit.changeBottomNavBarCurrentIndex(i);
                    },
                    tabs: const [
                      // ignore: prefer_const_constructors
                      GButton(
                        icon: IconBroken.Home,
                        text: 'الصفحة الرئيسية',
                      ),
                      // ignore: prefer_const_constructors
                      GButton(
                        icon: IconBroken.Upload,
                        text: 'نشر',
                      ),

                      GButton(
                        icon: IconBroken.Profile,
                        text: 'حسابي',
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}
