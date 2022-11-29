import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../shared/components/components.dart';

// ignore: camel_case_types
class Carousel_Slider extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  List<String> imagesSlider;

  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  Carousel_Slider({required this.imagesSlider});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 200,
          child: CarouselSlider(
            options: CarouselOptions(
              height: 400,
              aspectRatio: 16 / 9,
              viewportFraction: 1,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            ),
            items: imagesSlider.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          i,
                          fit: BoxFit.cover,
                        ),
                      ));
                },
              );
            }).toList(),
          ),
        ),
        // Positioned(
        //   top: 10,
        //   right: 30,
        //   child: Container(
        //       decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(12),
        //           color: Colors.green.withOpacity(0.5)),
        //       child: titleText('أقوى العروض')),
        // )
      ],
    );
  }
}
