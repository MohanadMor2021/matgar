import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:like_button/like_button.dart';

import '../styles/icon_broken.dart';
import 'constants.dart';

Widget textFormField({
  TextEditingController? controller,
  Widget? suffixIcon,
  Widget? prefixIcon,
  OutlineInputBorder? enabledBorder,
  OutlineInputBorder? focusedBorder,
  Color? fillColor,
  Color? cursorColor,
  String? hintText,
  String? labelText,
  TextStyle? hintStyle,
  TextStyle? labelStyle,
  TextStyle? style,
  bool? filled,
  int? maxLines,
//  TextInputAction textInputAction,
  TextInputType? keyboardType,
  dynamic? validator,
}) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      enabledBorder: enabledBorder,
      focusedBorder: focusedBorder,
      fillColor: fillColor,
      hintText: hintText,
      hintStyle: hintStyle,
      labelText: labelText,
      labelStyle: labelStyle,
      filled: filled,
    ),
    style: style,
    // textInputAction: textInputAction,
    validator: validator,
    cursorColor: cursorColor,
    maxLines: maxLines,
    keyboardType: keyboardType,
  );
}

OutlineInputBorder focusedBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(8.0),
  borderSide: BorderSide(
    width: 1.3,
    color: indigo,
  ),
);

OutlineInputBorder enabledBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(8.0),
  borderSide: const BorderSide(
    color: Colors.grey,
  ),
);

navigatorPush(context, screen) {
  return Navigator.push(context, MaterialPageRoute(builder: (context) {
    return screen;
  }));
}

navigatorReplacement(context, screen) {
  return Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (context) {
    return screen;
  }));
}

Widget profileItem({
  required BuildContext context,
  String? title,
  String? content,
  dynamic? onTap,
}) {
  return Padding(
    padding: const EdgeInsets.only(
      top: 15.0,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title!,
          style: TextStyle(color: indigo, fontSize: 16),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.grey[50],
          ),
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    content!,
                    style: const TextStyle(
                      color: Colors.grey,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                InkWell(
                  onTap: onTap,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.0),
                      color: Colors.white,
                    ),
                    width: 35,
                    height: 35,
                    child: Icon(
                      IconBroken.Edit,
                      color: indigo,
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

Widget gradientButton(
    {required BuildContext context, onPressed, Widget? title}) {
  return Container(
    clipBehavior: Clip.antiAlias,
    width: MediaQuery.of(context).size.width,
    height: 50,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        gradient: LinearGradient(
          colors: [
            indigo,
            Colors.green.shade200,
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        )),
    child: MaterialButton(
      onPressed: onPressed,
      child: title,
    ),
  );
}

Widget titleText(
  myText,
) {
  return Container(
    margin: const EdgeInsets.only(right: 20),
    child: Text(
      myText,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 22,
        letterSpacing: 1,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget productItem({
  required BuildContext context,
  String? title,
  String? image,
  String? subtitle,
  String? content,
  dynamic? onTap,
}) {
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
                  onTap: onTap,
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

// ignore: non_constant_identifier_names
Widget PostTitle({required String title}) {
  return Center(
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 17, fontWeight: FontWeight.w200, letterSpacing: 0.5),
      ),
    ),
  );
}

Widget userPost() {
  return Card(
    elevation: 1,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          maxRadius: 25,
          minRadius: 20,
          child: Image.asset('assets/images/sheep.png'),
        ),
        Container(
            padding: const EdgeInsets.only(right: 10),
            child: Column(
              children: const [
                Text(
                  'مهند محمد مرتجى',
                  style: TextStyle(fontSize: 18, letterSpacing: .8),
                ),
                Text(
                  '0597888618',
                  style: TextStyle(fontSize: 11),
                ),
              ],
            )),
        Spacer(),
        Container(
          margin: const EdgeInsets.only(left: 30),
          child: Column(
            children: const [
              Text(
                '16/1/2023',
                style: TextStyle(fontSize: 18, letterSpacing: .8),
              ),
              Text(
                'pm 12:30 ',
                style: TextStyle(fontSize: 18, letterSpacing: .8),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

// ignore: non_constant_identifier_names
Widget ImageSlider({required List<String> imgList}) {
  return Container(
      constraints: const BoxConstraints(minHeight: 100, maxHeight: 250),
      child: CarouselSlider(
        options: CarouselOptions(height: 400.0),
        items: imgList.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(color: Colors.green.shade200),
                  child: Image.asset(
                    i,
                    fit: BoxFit.contain,
                  ));
            },
          );
        }).toList(),
      ));
}

Widget reactionItems() {
  return Card(
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Row(
        children: [
          Expanded(child: likeButton()),
          const Expanded(
              child: Icon(
            Icons.comment_outlined,
            size: 35,
          )),
        ],
      ),
    ),
  );
}

Widget likeButton() {
  return LikeButton(
    size: 35,
    circleColor:
        const CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
    bubblesColor: const BubblesColor(
      dotPrimaryColor: Color(0xff33b5e5),
      dotSecondaryColor: Color(0xff0099cc),
    ),
    likeBuilder: (bool isLiked) {
      return Icon(
        Icons.favorite,
        color: isLiked ? const Color.fromARGB(255, 255, 77, 77) : Colors.grey,
        size: 35,
      );
    },
    likeCount: 665,
    countBuilder: (count, bool isLiked, String text) {
      var color = isLiked ? Colors.deepPurpleAccent : Colors.grey;
      Widget result;
      if (count == 0) {
        result = Text(
          "love",
          style: TextStyle(color: color),
        );
      } else {
        result = Text(
          text,
          style: TextStyle(color: color),
        );
      }
      return result;
    },
  );
}

Widget myCircleAvatar(
    String img, double radiusIn, double radiusOut, double borderraduis) {
  return CircleAvatar(
    radius: radiusOut,
    backgroundColor: indigo,
    child: CircleAvatar(
      backgroundColor: Colors.white,
      radius: borderraduis,
      child: CachedNetworkImage(
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/f/f3/Zinedine_Zidane_by_Tasnim_03.jpg',
        placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(
          strokeWidth: 1.5,
        )),
        errorWidget: (context, url, error) => Icon(
          Icons.error,
          color: indigo,
        ),
        imageBuilder: (context, imageProvider) => CircleAvatar(
          backgroundImage: imageProvider,
          radius: radiusIn,
        ),
      ),
    ),
  );
}

Widget staticNames(String name) {
  return Padding(
    padding: const EdgeInsets.only(right: 20),
    child: Text(
      name,
      style: const TextStyle(fontSize: 22, color: Colors.black),
    ),
  );
}

Widget myRating() {
  return SizedBox(
    width: 180,
    child: RatingBar.builder(
      initialRating: 3,
      minRating: 1,
      itemSize: 30.0,
      direction: Axis.horizontal,
      ignoreGestures: true,
      itemCount: 5,
      itemPadding: const EdgeInsets.symmetric(horizontal: 2),
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        print(rating);
      },
    ),
  );
}

Widget ratingOther() {
  return SizedBox(
    width: 180,
    child: RatingBar.builder(
      initialRating: 3,
      minRating: 1,
      itemSize: 30.0,
      direction: Axis.horizontal,
      itemCount: 5,
      itemPadding: const EdgeInsets.symmetric(horizontal: 2),
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        print(rating);
      },
    ),
  );
}
