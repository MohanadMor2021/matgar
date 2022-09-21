import 'package:flutter/material.dart';
import 'package:matgar/modules/home_screen/details_screen.dart';
import 'package:matgar/shared/components/components.dart';

import '../../shared/styles/icon_broken.dart';

// ignore: must_be_immutable
class HomeScreenItem extends StatelessWidget {
  String? title;
  String? image;
  String? subtitle;
  String? content;

  HomeScreenItem(
      {super.key, this.title, this.image, this.subtitle, this.content});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 15.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 5,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 11),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade200),
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            width: MediaQuery.of(context).size.width,
            // ignore: prefer_const_constructors
            constraints: BoxConstraints(
              minHeight: 100,
              maxHeight: 150,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      margin: const EdgeInsets.only(left: 10),
                      constraints:
                          const BoxConstraints(minWidth: 100, maxWidth: 120),
                      child: Image.asset(
                        '$image',
                        fit: BoxFit.contain,
                      )),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title!,
                          style: const TextStyle(
                              color: Colors.black,
                              overflow: TextOverflow.fade,
                              fontWeight: FontWeight.normal,
                              fontSize: 17),
                        ),
                        Text(
                          subtitle!,
                          style: const TextStyle(
                              color: Colors.black,
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Roboto',
                              fontSize: 11),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      navigatorPush(context, const DetailsScreen());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.0),
                          color: Colors.grey.shade200),
                      width: 50,
                      height: 50,
                      child: const Icon(
                        IconBroken.Arrow___Left,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
