import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: Color.fromARGB(255, 238, 118, 118), // <-- SEE HERE
      onPrimary: Colors.white, // <-- SEE HERE
      onSurface: Colors.black, // <-- SEE HERE
    ),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      titleTextStyle: GoogleFonts.secularOne(
          color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0,
    ),
  );

//Cairo
//PlayfairDisplay
  TextStyle get headLine1 {
    return TextStyle(
      fontSize: 25,
      color: Colors.black,
      fontFamily: 'PlayfairDisplay',
    );
  }

  TextStyle get headLine2 {
    return TextStyle(
      fontSize: 20,
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontFamily: 'PlayfairDisplay',
    );
  }

  TextStyle get headLine3 {
    return TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.black54,
      fontFamily: 'PlayfairDisplay',
    );
  }

  TextStyle get headLine4 {
    return TextStyle(
      fontSize: 25,
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontFamily: 'PlayfairDisplay',
    );
  }
}
