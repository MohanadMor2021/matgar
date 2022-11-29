import 'package:flutter/material.dart';

import '../network/local/cache_helper.dart';
import 'components.dart';

Color teal = Color(0xff6cd8d1);
Color blue = Color(0xff2663e3);
 Color indigo = Color(0xff6cd8d1);
 // Color indigo = Color(0xff869B4B);
Color orange = Color(0xfffea41d);

Color primaryDark1 = Color(0xff171D2D);
Color secondaryDark1 = Color(0xff1E2336);

Color primaryDark2 = Color(0xff26272c);
Color secondaryDark2 = Color(0xff292c35);

String? base64Image;

String? token;

void logout(context) {
  CacheHelper.removeData(key: 'token').then((value) {
    //  navigatorReplacement(context, LoginScreen());
  });
}
