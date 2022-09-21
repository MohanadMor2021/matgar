import 'package:flutter/material.dart';
import 'package:matgar/shared/components/components.dart';

import '../../item/home_screen_item/home_screen_item.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              titleText('المواشي'),
              const Divider(),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return HomeScreenItem(
                      title: 'خرفان للبيع',
                      subtitle: '12 خروف',
                      image: 'assets/images/sheep.png');
                },
                itemCount: 8,
              )
            ],
          ),
        ),
      ),
    );
  }
}
