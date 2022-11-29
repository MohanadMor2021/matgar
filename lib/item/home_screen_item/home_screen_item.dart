import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matgar/models/category_model.dart';
import 'package:matgar/shared/components/components.dart';

import '../../dummy_data/categories_data.dart';
import '../../modules/home_screen/products_screen.dart';

class HomeScreenItem extends StatefulWidget {
  final Item2 categories;

  HomeScreenItem(this.categories);

  @override
  State<HomeScreenItem> createState() => _HomeScreenItemState();
}

class _HomeScreenItemState extends State<HomeScreenItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigatorPush(context, ProductsScreen(widget.categories.id));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Container(
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.grey, width: 1),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(5),
                  // child: Image.asset(
                  //   widget.categories.image,
                  //   width: 80,
                  //   color: Color(0xff869B4B),
                  // ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.categories.name.toString(),
                      style: GoogleFonts.cairo(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      ("العدد | ${widget.categories.count}"),
                      style: GoogleFonts.cairo(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Container(
                  alignment: Alignment.center,
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}





/*
 Padding(
        padding: const EdgeInsets.only(
          top: 15.0,
        ),
        child: Stack(
          children: [
            Container(
              height: 150,

              margin: const EdgeInsets.symmetric(horizontal: 11, vertical: 5),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade200),
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.green.withOpacity(0.2),
                    spreadRadius: 2.5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              width: MediaQuery.of(context).size.width,
              // ignore: prefer_const_constructors

              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(
                  '$image',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
                bottom: -5,
                right: 10,
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 160),
                  decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Text(
                    subtitle.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        wordSpacing: 2.5,
                        letterSpacing: 1),
                  ),
                )),
          ],
        ),
      ),
 */