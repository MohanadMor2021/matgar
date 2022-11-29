import 'dart:async';

import 'package:flutter/material.dart';

import 'modules/login/login_screen.dart';
import 'modules/onboarding/onboarding_screen.dart';



class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
        Duration(seconds: 3),
            () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) =>LoginScreen()));
        }
    );

  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Stack(
          children: [

            Container(
              height: double.infinity,
              //  width: MediaQuery.of(context).size.width,
              child: Image.asset("assets/images/Splash.png" ,
                fit: BoxFit.fill,
              ),
            ),



            Positioned(
                top:70,
                right: 60,
                child: Image.asset("assets/images/Logo_1.png" , width: 300, color: Color(0xff869B4B),))

          ],
        ),
      ),
    );
  }
}
