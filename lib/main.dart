import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'features/home/presentation/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hamyon app',
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent, primary: Colors.deepPurple, secondary: Colors.deepPurpleAccent),
      ),
      home: const Home(),
    );
  }
}
