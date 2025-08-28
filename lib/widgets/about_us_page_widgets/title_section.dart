import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle ({super.key, required this.title});

  @override
  Widget build(BuildContext context)  {
    return Text(
      title,
      style: GoogleFonts.quicksand(
        fontSize: 22,
        fontWeight: FontWeight.w700,
         color: Colors.blueGrey[800],
      ),
    );
  }
}