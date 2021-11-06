import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff121318),
        focusColor: Color(0xFFFFFFFF),
        backgroundColor: Color(0xff121318),
        highlightColor: Color(0xff383B40),
        textTheme: TextTheme(
          bodyText1: GoogleFonts.manrope(
              fontWeight: FontWeight.w300, letterSpacing: -1.5),
        ),
      ),
      home: const HomePage(),
    );
  }
}
