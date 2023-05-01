import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


const seedColor = Color.fromARGB(255, 7, 80, 59);


class AppTheme {


  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: seedColor,

    listTileTheme: const ListTileThemeData(
      iconColor: seedColor,
    ),

    textTheme: TextTheme(
      titleLarge: GoogleFonts.montserratAlternates(),
      titleMedium: GoogleFonts.russoOne( fontSize: 25 ),
    )

  );

}