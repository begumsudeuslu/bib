import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnimatedTextFieldSection extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final int maxLines;
  final IconData icon;

  const AnimatedTextFieldSection ({super.key, required this.controller, required this.labelText, required this.maxLines, required this.icon});

  @override
  Widget build(BuildContext context)  {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 300),
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        return Transform.scale(
          scale: 0.9 + (value * 0.1),
          child: Opacity(
            opacity: value,
            child: TextField(
              controller: controller,
              maxLines: maxLines,
              decoration: InputDecoration(
                labelText: labelText,
                prefixIcon: Icon(icon, color: Colors.blueGrey[300]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: Colors.blueGrey[200]!,
                    width: 1.5,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: Colors.blueGrey[100]!,
                    width: 1.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: Colors.blueGrey[700]!,
                    width: 2,
                  ),
                ),
                labelStyle: GoogleFonts.quicksand(
                  color: Colors.blueGrey[600],
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}