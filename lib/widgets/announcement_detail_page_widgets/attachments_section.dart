import 'package:flutter/material.dart';

class AttachmentsSection extends StatelessWidget {
  final List<String> attachments;
  final String Function(String) onGetFileNameFromUrl;

  const AttachmentsSection(
      {super.key,
      required this.attachments,
      required this.onGetFileNameFromUrl});

  @override
  Widget build(BuildContext context) {
    if (attachments.isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.attachment, size: 24, color: const Color(0xFF0D47A1)),
            const SizedBox(width: 10),
            Text(
              'Ek Dosyalar',
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: attachments
                .map((url) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: InkWell(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Dosya açılıyor: $url')),
                          );
                        },
                        child: Row(
                          children: [
                            Icon(Icons.file_present, color: Colors.blue[700]),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                onGetFileNameFromUrl(url),
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.blue[700],
                                    decoration: TextDecoration.underline),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}
