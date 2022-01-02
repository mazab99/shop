import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop/shared/constants/my_colors.dart';

var darkmode=ThemeData(
  inputDecorationTheme: InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(
        color: MyColors.primary,
      ),
    ),
    hintStyle: GoogleFonts.cairo(
      textStyle: TextStyle(
        color: Colors.white.withOpacity(0.7),
      ),
    ),
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
    titleTextStyle: GoogleFonts.kufam(
      textStyle: TextStyle(
        fontWeight: FontWeight.bold,
        color: MyColors.primary,
        fontSize: 20,
      ),
    ),
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
    selectedLabelStyle: GoogleFonts.cairo(
      textStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
    unselectedLabelStyle: GoogleFonts.cairo(
      textStyle: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
    ),
  ),
  textTheme: TextTheme(
    bodyText1: GoogleFonts.cairo(
      textStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white.withOpacity(0.9),
      ),
    ),
  ),
);