import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/country_model.dart';

class CountryItem extends StatefulWidget {
  final DataCountry post;

  const CountryItem(this.post);
  @override
  _CountryItemState createState() => _CountryItemState();
}

class _CountryItemState extends State<CountryItem> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: Container(
        alignment: Alignment.center,
        height: 120,
        width: MediaQuery.of(context).size.width * 0.30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade300,
          border: Border.all(
              color: selected ? Color(0xff869B4B) : Colors.grey.shade300,
              width: 2.5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.center,
              height: 50,
              width: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Image.asset(
                "assets/images/uae_icon.png",
                width: 50,
              ),
            ),
            Text(
              "${widget.post.name}",
              style: GoogleFonts.cairo(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
