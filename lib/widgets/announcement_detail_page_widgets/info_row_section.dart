import 'package:flutter/material.dart';

class InfoRowSection extends StatelessWidget {
  final String label;
  final String content;
  final IconData icon;

  const InfoRowSection ({super.key, required this.icon, required this.label, required this.content});

  @override
  Widget build(BuildContext context)  {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 22, color: const Color(0xFF0D47A1)),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1A237E),
              ),
            ),
            Text(
              content,
              style: TextStyle(fontSize: 15, color: Colors.grey[800]),
            ),
          ],
        ),
      ],
    );

  }
}