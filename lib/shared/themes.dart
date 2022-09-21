import 'package:flutter/material.dart';

ThemeData myTheme() => ThemeData(
      fontFamily: 'Shoroq',
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.green.shade200,
        elevation: 0,
        actionsIconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: const TextStyle(
          fontFamily: 'Shoroq',
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      primarySwatch: Colors.green,
      scaffoldBackgroundColor: Colors.white,
      textTheme: const TextTheme(
          bodyText1: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontFamily: 'Shoroq',
      )),
    );
