// lib/BusInBr/announcement_detail_page.dart

import 'package:flutter/material.dart';
import 'announcement.dart';
import 'package:intl/intl.dart';
import 'utils/app_colors.dart'; // Yeni helper dosyasını import et

class AnnouncementDetailPage extends StatelessWidget {
  final Announcement announcement;

  const AnnouncementDetailPage({super.key, required this.announcement});

  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('dd MMMM yyyy HH:mm', 'tr_TR');
    final String formattedPublishDate = formatter.format(announcement.publishDate);
    final String? formattedEndDate = announcement.endDate != null
        ? formatter.format(announcement.endDate!)
        : null;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          announcement.title,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF0D47A1),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFe0e7ff),
                  Color(0xFFf8fafc),
                  Color(0xFFc7d2fe),
                ],
              ),
            ),
          ),
          Positioned(
            top: -60,
            left: -60,
            child: Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color.fromARGB(46, 68, 138, 255),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(64, 68, 138, 255),
                    blurRadius: 80,
                    spreadRadius: 30,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            right: -40,
            child: Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color.fromARGB(33, 124, 77, 255),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(46, 124, 77, 255),
                    blurRadius: 60,
                    spreadRadius: 20,
                  ),
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (announcement.imageUrl != null)
                  Center(
                    child: Hero(
                      tag: 'announcement-image-${announcement.id}',
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.network(
                          announcement.imageUrl!,
                          height: 250,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              height: 250,
                              width: double.infinity,
                              color: Colors.grey[300],
                              child: Icon(Icons.broken_image, size: 60, color: Colors.grey[600]),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                const SizedBox(height: 20),
                Text(
                  announcement.title,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A237E),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Chip(
                      label: Text(announcement.category, style: const TextStyle(fontSize: 14, color: Colors.white)),
                      backgroundColor: getCategoryColor(announcement.category, context), // Bu satırda değişiklik yapıldı
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Yayınlayan: ${announcement.author}',
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                _buildInfoRow(Icons.calendar_today, 'Yayın Tarihi', formattedPublishDate),
                if (formattedEndDate != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: _buildInfoRow(Icons.event_busy, 'Son Geçerlilik', formattedEndDate),
                  ),
                const SizedBox(height: 15),
                Text(
                  announcement.content,
                  style: TextStyle(fontSize: 16, color: Colors.grey[800], height: 1.5),
                ),
                const SizedBox(height: 20),
                _buildAttachmentsSection(announcement.attachments, context), // Bu satırda değişiklik yapıldı
                const SizedBox(height: 15),
                _buildTagsSection(announcement.tags),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildInteractionButton(
                      icon: Icons.thumb_up_alt_outlined,
                      label: 'Beğen',
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Beğeni özelliği yakında!')),
                        );
                      },
                    ),
                    _buildInteractionButton(
                      icon: Icons.comment_outlined,
                      label: 'Yorum Yap',
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Yorum özelliği yakında!')),
                        );
                      },
                    ),
                    _buildInteractionButton(
                      icon: Icons.share,
                      label: 'Paylaş',
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Paylaşma özelliği yakında!')),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Bu kısım yukarıdaki getCategoryColor fonksiyonu ile değiştirildi
  // Color _getCategoryColor(String category) { ... } // Bu metodu silin

  // Diğer yardımcı widget'lar (buildInfoRow, buildAttachmentsSection, buildTagsSection, buildInteractionButton)
  // hala AnnouncementDetailPage içinde kalabilir, çünkü bunlar context'e erişmiyor veya
  // bu sınıfın dışından doğrudan çağrılmıyor.

  Widget _buildInfoRow(IconData icon, String label, String content) {
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

  Widget _buildAttachmentsSection(List<String> attachments, BuildContext context) {
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
            children: attachments.map((url) => Padding(
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
                        _getFileNameFromUrl(url),
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
            )).toList(),
          ),
        ),
      ],
    );
  }

  String _getFileNameFromUrl(String url) {
    final uri = Uri.parse(url);
    String fileName = uri.pathSegments.last;
    if (fileName.isEmpty) return url;
    return fileName;
  }

  Widget _buildTagsSection(List<String> tags) {
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
            children: tags.map((tag) => Chip(
              label: Text('#$tag', style: const TextStyle(fontSize: 14, color: Color(0xFF1A237E))),
              backgroundColor: const Color(0xFFBBDEFB).withOpacity(0.7),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(color: Color(0xFF64B5F6), width: 0.5),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            )).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildInteractionButton({required IconData icon, required String label, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: Column(
          children: [
            Icon(icon, size: 28, color: const Color(0xFF0D47A1)),
            const SizedBox(height: 5),
            Text(label, style: const TextStyle(fontSize: 13, color: Color(0xFF1A237E))),
          ],
        ),
      ),
    );
  }
}