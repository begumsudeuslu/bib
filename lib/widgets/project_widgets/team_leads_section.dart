import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TeamLeadsSection extends StatelessWidget {
  final List<String> teamLeads;

  const TeamLeadsSection({super.key, required this.teamLeads});

  @override
  Widget build(BuildContext context) {
    if (teamLeads.isEmpty) return const SizedBox.shrink();
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
            Icons.groups_rounded,
            color: Colors.blueGrey[700],
            size: 20,
          ),
        ),
        title: Text(
          'Proje Lider(ler)i',
          style: GoogleFonts.quicksand(
            fontWeight: FontWeight.w700,
            color: Colors.blueGrey[800],
            fontSize: 18,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: teamLeads
              .map((leader) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      children: [
                        Icon(Icons.person_outline_rounded,
                            size: 18, color: Colors.blueGrey[600]),
                        const SizedBox(width: 8),
                        Text(leader,
                            style: GoogleFonts.quicksand(
                                fontSize: 16, color: Colors.blueGrey[700])),
                      ],
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
