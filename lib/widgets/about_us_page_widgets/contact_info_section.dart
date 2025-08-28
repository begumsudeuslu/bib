import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactInfoSection extends StatelessWidget {
  final String title;
  final String content;
  final IconData icon;

  const ContactInfoSection ({super.key, required this.icon, required this.title, required this.content});

  @override
  Widget build(BuildContext context)  {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey.withOpacity(0.1),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blueGrey[100],
            boxShadow: [
              BoxShadow(
                color: Colors.blueGrey.withOpacity(0.2),
                blurRadius: 8,
                spreadRadius: 2,
              )
            ],
          ),
          child: Icon(
            icon,
            color: Colors.blueGrey[700],
            size: 24,
          ),
        ),
        title: Text(
          title,
          style: GoogleFonts.quicksand(
            fontWeight: FontWeight.w700,
            color: Colors.blueGrey[800],
            fontSize: 18,
          ),
        ),
        subtitle: Text(
          content,
          style: GoogleFonts.quicksand(
            color: Colors.blueGrey[600],
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );

  }
}