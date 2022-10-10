import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:matgar/shared/components/components.dart';

import '../../shared/components/constants.dart';
import '../../shared/styles/icon_broken.dart';

// ignore: camel_case_types
class profile_other extends StatelessWidget {
  const profile_other({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10, bottom: 30),
                  child: myCircleAvatar('', 60, 64, 62),
                ),
                myRating(),
              ],
            ),
            const Divider(),
            Row(
              children: [
                staticNames('الاسم :'),
                Padding(
                  padding: const EdgeInsets.only(right: 60),
                  child: Text(
                    'Mohanad M Mortaja',
                    style: TextStyle(color: indigo, fontSize: 25),
                  ),
                ),
              ],
            ),
            const Divider(),
            Row(
              children: [
                staticNames('رقم الجوال :'),
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Text(
                    '+9720597888618',
                    style: TextStyle(color: indigo, fontSize: 25),
                  ),
                ),
              ],
            ),
            const Divider(),
            Row(
              children: [
                staticNames('تقييم المستخدم :'),
                ratingOther(),
              ],
            ),
            const Divider(),
            staticNames('التواصل مع الشخص'),
          ],
        ),
      ),
    );
  }
}
