import 'package:flutter/material.dart';

class InteractionButtonSection extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const InteractionButtonSection(
      {super.key,
      required this.icon,
      required this.label,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: Column(
          children: [
            Icon(icon, size: 28, color: const Color(0xFF0D47A1)),
            const SizedBox(height: 5),
            Text(label,
                style: const TextStyle(fontSize: 13, color: Color(0xFF1A237E))),
          ],
        ),
      ),
    );
  }
}
