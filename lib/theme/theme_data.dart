import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Fonts
const standFont = "Manrope";
const mainTitleFont = "DM Sans";
const bodyFont = "Manrope";

//General Colors

const colorPrimary = Color(0xFF29C1F6);
const colorBody = Color(0xFF1d233b);
const colorSecondary = Color(0xFFF51B8F);
const colorTertiary = Color(0xFF9FC804);
const colorBtnTxt = Colors.white;

ThemeData defaultTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: colorPrimary,
      onPrimary: Colors.white,
      secondary: colorSecondary,
      onSecondary: Colors.white,
      tertiary: colorTertiary,
      background: Colors.white,
      onBackground: Colors.white,
      surface: colorBody,
      onSurface: Colors.white,
      error: Color.fromARGB(255, 219, 0, 77),
      onError: Color.fromARGB(162, 219, 0, 77),
    ),
    textTheme: TextTheme(
        //Títulos claros con Poppins
        displayLarge: TextStyle(
            color: colorBody,
            fontFamily: GoogleFonts.getFont(mainTitleFont).fontFamily,
            fontWeight: FontWeight.bold,
            fontSize: 30.0,
            letterSpacing: -0.50),

        //Títulos de rows
        headlineLarge: TextStyle(
            color: colorBody,
            fontFamily: GoogleFonts.getFont(mainTitleFont).fontFamily,
            fontWeight: FontWeight.bold,
            fontSize: 35.0,
            letterSpacing: -0.25),
        headlineMedium: TextStyle(
            color: colorBody,
            fontFamily: GoogleFonts.getFont(bodyFont).fontFamily,
            fontWeight: FontWeight.w700,
            fontSize: 25.0,
            height: 0.8,
            letterSpacing: -0.50),

        //Títulos de headers para páginas básicas
        titleLarge: TextStyle(
          color: colorBody,
          fontFamily: GoogleFonts.getFont(mainTitleFont).fontFamily,
          fontWeight: FontWeight.bold,
          fontSize: 60,
          letterSpacing: -1.0,
        ),
        titleMedium: TextStyle(
          color: colorBody,
          fontFamily: GoogleFonts.getFont(mainTitleFont).fontFamily,
          fontWeight: FontWeight.bold,
          fontSize: 30,
          letterSpacing: -0.5,
        ),
        titleSmall: TextStyle(
          color: colorBody,
          fontFamily: GoogleFonts.getFont(bodyFont).fontFamily,
          fontWeight: FontWeight.bold,
          fontSize: 24,
          letterSpacing: 0.25,
        ),
        headlineSmall: TextStyle(
            color: colorPrimary,
            fontFamily: GoogleFonts.getFont(bodyFont).fontFamily,
            fontWeight: FontWeight.bold,
            fontSize: 15.0,
            height: 0.8,
            letterSpacing: -0.50),
        bodyLarge: TextStyle(
          color: colorBody,
          fontFamily: GoogleFonts.getFont(bodyFont).fontFamily,
          fontSize: 15.0,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5,
          height: 1.75,
        ),
        bodyMedium: TextStyle(
          color: colorBody,
          fontFamily: GoogleFonts.getFont(bodyFont).fontFamily,
          fontSize: 14.0,
          letterSpacing: 0.25,
          height: 1.75,
        ),
        bodySmall: TextStyle(
          color: colorBody,
          fontFamily: GoogleFonts.getFont(bodyFont).fontFamily,
          fontSize: 14.0,
          letterSpacing: 0.5,
          fontWeight: FontWeight.normal,
          height: 1.75,
        ),
        labelLarge: TextStyle(
          color: colorBody,
          fontFamily: GoogleFonts.getFont(mainTitleFont).fontFamily,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          letterSpacing: -0.05,
          height: 1.5,
        ),
        labelMedium: TextStyle(
          color: colorBody,
          fontFamily: GoogleFonts.getFont(mainTitleFont).fontFamily,
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
          letterSpacing: -0.05,
          height: 1.5,
        )),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
      padding: MaterialStateProperty.all(const EdgeInsets.all(20.0)),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      textStyle: MaterialStateProperty.all(TextStyle(
          foreground: Paint()
            ..style = PaintingStyle.fill
            ..color = colorBody,
          fontFamily: GoogleFonts.getFont(standFont).fontFamily,
          fontWeight: FontWeight.w600,
          fontSize: 12.0,
          letterSpacing: 0.5)),
    )),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
      padding: MaterialStateProperty.all(const EdgeInsets.all(20.0)),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      side: MaterialStateProperty.resolveWith<BorderSide>(
        (Set<MaterialState> states) {
          return const BorderSide(width: 01.0, color: colorPrimary);
        },
      ),
      textStyle: MaterialStateProperty.all(TextStyle(
          foreground: Paint()
            ..style = PaintingStyle.fill
            ..color = colorPrimary,
          fontFamily: GoogleFonts.getFont(bodyFont).fontFamily,
          fontWeight: FontWeight.w600,
          fontSize: 12.0,
          letterSpacing: 0.5)),
    )),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
      padding: MaterialStateProperty.all(const EdgeInsets.all(20.0)),
      elevation: MaterialStateProperty.all(5.0),
      shadowColor: MaterialStateProperty.all(colorPrimary),
      textStyle: MaterialStateProperty.all(TextStyle(
          color: colorBtnTxt,
          fontFamily: GoogleFonts.getFont(bodyFont).fontFamily,
          fontWeight: FontWeight.w600,
          fontSize: 12.0,
          letterSpacing: 0.5)),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      backgroundColor: MaterialStateProperty.all(colorBody),
    )));
