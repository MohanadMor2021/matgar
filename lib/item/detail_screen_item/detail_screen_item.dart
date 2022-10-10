import 'package:flutter/material.dart';
import 'package:matgar/item/detail_screen_item/network_player_video.dart';
import 'package:matgar/shared/components/components.dart';

class DetailScreenItem extends StatelessWidget {
  const DetailScreenItem({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    List<String> Images = [
      'assets/images/sheep.png',
      'assets/images/sheep.png',
      'assets/images/sheep.png',
    ];
    return Card(
      elevation: 5,
      shadowColor: Colors.amber,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade200),
          borderRadius: BorderRadius.circular(0),
          color: Colors.white,
        ),
        margin: const EdgeInsets.symmetric(
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            userPost(),
            PostTitle(
                title:
                    'بعد الصلاة على النبي   لعشاق التميز 🤩 خاروف عمر 10شهور 🥰قاااااطع الوصف مكفول هداد ونطاحه 💯 نار حمرا 🔥 موجود في جنين المعنى على الرقم 0568573900📞🌹 💞'),
            ImageSlider(imgList: Images),
            Container(
                constraints:
                    const BoxConstraints(minHeight: 100, maxHeight: 300),
                child: const NetworkPlayerWidget()),
            reactionItems()
          ],
        ),
      ),
    );
  }
}
