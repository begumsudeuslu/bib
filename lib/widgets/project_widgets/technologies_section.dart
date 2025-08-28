import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TechnologiesSection extends StatelessWidget {
  final List<String> technologies;

  const TechnologiesSection ({super.key, required this.technologies});

  @override
  Widget build(BuildContext context)  {
    if (technologies.isEmpty) return const SizedBox.shrink();
    return Container(
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
            Icons.code_rounded,
            color: Colors.blueGrey[700],
            size: 20,
          ),
        ),
        title: Text(
          'Kullanılan Teknolojiler',
          style: GoogleFonts.quicksand(
            fontWeight: FontWeight.w700,
            color: Colors.blueGrey[800],
            fontSize: 18,
          ),
        ),
        subtitle: Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: technologies
              .map((tech) => Chip(
                    label: Text(tech,
                        style: GoogleFonts.quicksand(
                            fontSize: 14, color: Colors.blueGrey[800])),
                    backgroundColor: Colors.blueGrey.withOpacity(0.1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side:
                          BorderSide(color: Colors.blueGrey[200]!, width: 0.5),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  ))
              .toList(),
        ),
      ),
    );
  }
}