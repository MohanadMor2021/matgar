import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matgar/modules/home_screen/home_screen.dart';
import 'package:matgar/shared/components/components.dart';


import '../../layout/home_layout.dart';
//import 'package:firebase_auth/firebase_auth.dart';

// ignore: must_be_immutable
class OtpScreen extends StatelessWidget {
  String errorMessage = '';
  Timer? _timer;

  @override
  Widget build(BuildContext context) {
    //Getting screen height width
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: screenHeight * 0.05,
                ),

                SizedBox(
                  height: screenHeight * 0.05,
                ),
                // Image.asset(
                //   'assets/images/varification.png',
                //   height: screenHeight * 0.3,
                //   fit: BoxFit.contain,
                // ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                 Text(
                  'تحقق',

                   style: GoogleFonts.cairo(
                     fontSize: 20,
                     fontWeight: FontWeight.bold,
                     color: Colors.black,
                   ),

                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                 Text(
                  'أدخل الأرقام المرسلة إلى البريد المدخل',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.cairo(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.04,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      // ignore: prefer_const_literals_to_create_immutables
                      boxShadow: [
                        const BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 6.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(16.0)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Container(
                      //   margin: EdgeInsets.only(left: screenWidth * 0.025),
                      //   child: PinEntryTextField(
                      //     fields: 6,
                      //     onSubmit: (text) {
                      //       //  smsOTP = text as String;
                      //     },
                      //   ),
                      // ),
                      SizedBox(
                        height: screenHeight * 0.04,
                      ),
                      GestureDetector(
                        onTap: () {
                          //    verifyOtp();
                          navigatorPush(context, ShopLayoutScreen());
                        },
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          height: 45,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xff869B4B),

                            borderRadius: BorderRadius.circular(36),
                          ),
                          alignment: Alignment.center,
                          child:  Text(
                            'تحقق',
                            style: GoogleFonts.cairo(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                        ),
                      ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
