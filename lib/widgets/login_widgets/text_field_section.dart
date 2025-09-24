import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldSection extends StatelessWidget{
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final TextInputType keyboardType;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;

  const TextFieldSection({super.key, required this.controller, required this. hintText, required this.icon, this.keyboardType=TextInputType.text,this.obscureText=false, this.inputFormatters,} );

  @override
  Widget build(BuildContext context){
    return Container(
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.3),
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 8,
          spreadRadius: 1,
        ),
      ],
    ),
    child: TextField(
      controller: controller,
      style: GoogleFonts.quicksand(color: Colors.white),
      keyboardType: keyboardType,
      obscureText: obscureText,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: GoogleFonts.quicksand(color: Colors.white70),
        prefixIcon: Icon(icon, color: Colors.white70),
        border: InputBorder.none,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
      ),
    ),
  );
  }
}
