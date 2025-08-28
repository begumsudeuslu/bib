import 'package:flutter/material.dart';

class TagSection extends StatelessWidget {
  final List<String> tags;

  const TagSection({
    super.key,
    required this.tags,
  });

  @override
  Widget build(BuildContext context) {
    if (tags.isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.label_outline, size: 24, color: const Color(0xFF0D47A1)),
            const SizedBox(width: 10),
            Text(
              'Etiketler',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1A237E),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.only(left: 34.0),
          child: Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: tags
                .map((tag) => Chip(
                      label: Text('#$tag',
                          style: const TextStyle(
                              fontSize: 14, color: Color(0xFF1A237E))),
                      backgroundColor: const Color(0xFFBBDEFB).withOpacity(0.7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(
                            color: Color(0xFF64B5F6), width: 0.5),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}
