import 'package:flutter/material.dart';
import 'package:frost_ice/icecream/view/icecream_view.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "flutter learn",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          fontFamily: GoogleFonts.dmSans().fontFamily),
      home: IcecreamView(),
    );
  }
}