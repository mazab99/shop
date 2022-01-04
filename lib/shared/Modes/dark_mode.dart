import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop/shared/constants/my_colors.dart';

var darkmode = ThemeData(
  inputDecorationTheme: InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(
        color: MyColors.primary,
      ),
    ),
    hintStyle: (TextStyle(
      color: Colors.white.withOpacity(0.7),
      fontWeight: FontWeight.w900,
      fontStyle: FontStyle.normal,
    )),
  ),
  scaffoldBackgroundColor: MyColors.secondary,
  primarySwatch: MyColors.primaryColor,
  appBarTheme: AppBarTheme(
    backgroundColor: MyColors.secondary,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: MyColors.secondary,
      statusBarIconBrightness: Brightness.light,
    ),
    elevation: 0,
    titleTextStyle: (TextStyle(
      fontWeight: FontWeight.w900,
      fontStyle: FontStyle.normal,
      color: MyColors.primary,
      fontSize: 20,
    )),
    iconTheme: IconThemeData(
      color: Colors.white.withOpacity(0.7),
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: MyColors.primary,
    unselectedItemColor: Colors.white.withOpacity(0.6),
    elevation: 20,
    backgroundColor: MyColors.secondary,
    selectedLabelStyle: (TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w900,
        fontStyle: FontStyle.normal)),
    unselectedLabelStyle: (TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w900,
        fontStyle: FontStyle.normal)),
  ),
  textTheme: TextTheme(
    bodyText1: (TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w900,
      fontStyle: FontStyle.normal,
      color: Colors.white.withOpacity(0.9),
    )),
  ),
);
