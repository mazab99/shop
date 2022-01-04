import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop/shared/constants/my_colors.dart';

var lightmode = ThemeData(
  inputDecorationTheme: InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: MyColors.primary),
    ),
    hintStyle: (
        TextStyle(
        color: MyColors.dark,
        fontWeight: FontWeight.w900,
        fontStyle: FontStyle.normal,

      )
    ),
  ),
  textTheme: TextTheme(
    bodyText1:(
        TextStyle(
        fontSize: 16,
          fontWeight: FontWeight.w900,
          fontStyle: FontStyle.normal,
        color: MyColors.secondary,
      )
    ),
  ),
  primarySwatch: MyColors.primaryColor,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    elevation: 0,
    titleTextStyle: (
       TextStyle(
        fontSize: 20,
         fontWeight: FontWeight.w900,
         fontStyle: FontStyle.normal,
        color: MyColors.primary,
      )
    ),
    iconTheme: IconThemeData(
      color: MyColors.secondary,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: MyColors.primary,
    unselectedItemColor: MyColors.dark,
    elevation: 20,
    backgroundColor: Colors.white,
    selectedLabelStyle: (
         TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w900,
           fontStyle: FontStyle.normal
      )
    ),
    unselectedLabelStyle:(
      TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
      )
    ),
  ),
);
