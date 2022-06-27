import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planetaex/screens/home_page.dart';

import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Planetaex',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        textTheme: TextTheme(
          bodyMedium: GoogleFonts.libreBaskerville(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          bodyLarge: GoogleFonts.libreBaskerville(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        backgroundColor: color1,
        inputDecorationTheme: InputDecorationTheme(
            hintStyle: const TextStyle(color: Colors.white),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: const BorderSide(color: Colors.red, width: 5),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: Colors.white,
                width: 2.0,
              ),
            ),
            border: const OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white, width: 5))),
        appBarTheme: AppBarTheme(
          backgroundColor: color1,
          foregroundColor: Colors.white,
          elevation: 0,
          titleTextStyle: GoogleFonts.libreBaskerville(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      home: const HomePage(),
    );
  }
}
