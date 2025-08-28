// lib/BusInBr/announcements_page.dart

import 'package:flutter/material.dart';
import 'announcement.dart'; // Yeni Announcement modelini import ettik
import 'announcement_detail_page.dart'; // Duyuru Detay Sayfasını import ettik
import '../utils/app_colors.dart'; // getCategoryColor fonksiyonunun bulunduğu dosya

class AnnouncementsPage extends StatefulWidget {
  const AnnouncementsPage({super.key});

  @override
  State<AnnouncementsPage> createState() => _AnnouncementsPageState();
}

class _AnnouncementsPageState extends State<AnnouncementsPage> {
  String _selectedCategory = 'Tümü';
  final TextEditingController _searchController = TextEditingController();
  String _searchText = '';

  final List<Announcement> _allAnnouncements = [
    // ... duyuru örnekleriniz ... (Değişiklik yok)
    Announcement(
      id: 'a001',
      title: 'Yıl Sonu Değerlendirme Toplantısı',
      content: 'Değerli ekip üyeleri, yıl sonu değerlendirme toplantımız 15 Aralık saat 10:00\'da büyük toplantı salonunda yapılacaktır. Katılımınız önemle rica olunur. Ajanda ve detaylar ekte sunulmuştur.',
      category: 'Genel',
      publishDate: DateTime(2025, 12, 1, 9, 30),
      author: 'Yönetim Kurulu',
      endDate: DateTime(2025, 12, 15),
      attachments: ['https://example.com/toplanti_ajandasi.pdf'],
      tags: ['Toplantı', 'Yıl Sonu', 'Değerlendirme'],
    ),
    Announcement(
      id: 'a002',
      title: 'Flutter Geliştirme Eğitimi Başlıyor!',
      content: 'Yeni başlayanlar için kapsamlı Flutter geliştirme eğitimi 20 Ekim\'de başlayacaktır. Eğitim programı ve kayıt koşulları için İK departmanıyla iletişime geçiniz.',
      category: 'İK',
      publishDate: DateTime(2025, 10, 5, 14, 0),
      author: 'İnsan Kaynakları',
      imageUrl: 'https://cdn.pixabay.com/photo/2017/08/07/04/43/flutter-2601934_1280.png',
      tags: ['Eğitim', 'Flutter', 'Geliştirme'],
    ),
    Announcement(
      id: 'a003',
      title: 'Yeni Projemiz "Bulut Tabanlı ERP" Başladı!',
      content: 'Şirketimizin en yeni projesi olan "Bulut Tabanlı ERP Sistemi" geliştirme süreci bugün itibarıyla başlamıştır. Bu stratejik projemizde tüm ekibimize başarılar dileriz! Proje ekibi ve hedefleri detay sayfasında.',
      category: 'Proje',
      publishDate: DateTime(2025, 8, 4, 10, 0), // Bugünün tarihi
      author: 'Proje Yönetimi',
      imageUrl: 'https://cdn.pixabay.com/photo/2017/07/31/11/45/cloud-2557580_1280.png',
      tags: ['ERP', 'Bulut', 'Yeni Proje'],
    ),
    Announcement(
      id: 'a004',
      title: 'Ofis Temizliği ve Dezenfeksiyon Bilgilendirmesi',
      content: 'Periyodik ofis temizliği ve dezenfeksiyon çalışmaları 10 Ağustos tarihinde yapılacaktır. Bu süreçte dikkat etmeniz gerekenler ve ofis kullanım kuralları ekteki belgededir.',
      category: 'Genel',
      publishDate: DateTime(2025, 8, 1, 11, 0),
      author: 'İdari İşler',
      attachments: ['https://example.com/ofis_kurallari.docx'],
      tags: ['Ofis', 'Temizlik', 'Hijyen'],
    ),
    Announcement(
      id: 'a005',
      title: 'İç İletişim Platformu Güncellemesi',
      content: 'İç iletişim platformumuzda performans iyileştirmeleri ve yeni özellikler içeren bir güncelleme yayınlanmıştır. Detaylar için Sıkça Sorulan Sorular bölümünü inceleyebilirsiniz. Geri bildirimleriniz için IT departmanıyla iletişime geçebilirsiniz.',
      category: 'Teknik',
      publishDate: DateTime(2025, 7, 28, 16, 0),
      author: 'IT Departmanı',
      tags: ['IT', 'Platform', 'Güncelleme'],
    ),
    Announcement(
      id: 'a006',
      title: 'Yaz Dönemi Sosyal Etkinliği: Barbekü Partisi!',
      content: 'Yazın tadını çıkarmak için tüm ekibimizi 25 Ağustos Cumartesi günü şirket bahçemizde düzenlenecek barbekü partisine davet ediyoruz. Detaylar ve kayıt için iç iletişim platformunu ziyaret edin.',
      category: 'Etkinlik',
      publishDate: DateTime(2025, 7, 20, 10, 0),
      author: 'Sosyal Komite',
      imageUrl: 'https://cdn.pixabay.com/photo/2016/06/13/23/07/bbq-1455201_1280.jpg',
      endDate: DateTime(2025, 8, 25),
      tags: ['Parti', 'Yaz', 'Sosyal Etkinlik'],
    ),
  ];

  final List<String> _categories = [
    'Tümü',
    'Genel',
    'İK',
    'Proje',
    'Etkinlik',
    'Teknik',
    'Yönetim'
  ];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _searchText = _searchController.text;
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Announcement> get _filteredAnnouncements {
    List<Announcement> filtered = _allAnnouncements;

    if (_selectedCategory != 'Tümü') {
      filtered = filtered.where((ann) => ann.category == _selectedCategory).toList();
    }

    if (_searchText.isNotEmpty) {
      final searchLower = _searchText.toLowerCase();
      filtered = filtered.where((ann) {
        return ann.title.toLowerCase().contains(searchLower) ||
            ann.content.toLowerCase().contains(searchLower) ||
            ann.author.toLowerCase().contains(searchLower) ||
            ann.category.toLowerCase().contains(searchLower) ||
            ann.tags.any((tag) => tag.toLowerCase().contains(searchLower));
      }).toList();
    }

    filtered.sort((a, b) => b.publishDate.compareTo(a.publishDate));
    return filtered;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Duyurular',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Duyurularda ara...',
                    prefixIcon: const Icon(Icons.search, color: Color(0xFF0D47A1)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.9),
                    contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                child: DropdownButtonFormField<String>(
                  value: _selectedCategory,
                  decoration: InputDecoration(
                    labelText: 'Kategori Seç',
                    prefixIcon: const Icon(Icons.category, color: Color(0xFF0D47A1)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.9),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                  ),
                  items: _categories.map((String category) {
                    return DropdownMenuItem<String>(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedCategory = newValue!;
                    });
                  },
                ),
              ),
              Expanded(
                child: _filteredAnnouncements.isEmpty
                    ? Center(
                        child: Text(
                          _searchText.isEmpty
                              ? 'Bu kategoride duyuru bulunmamaktadır.'
                              : 'Aradığınız duyuru bulunamadı.',
                          style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                        ),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                        itemCount: _filteredAnnouncements.length,
                        itemBuilder: (context, index) {
                          final announcement = _filteredAnnouncements[index];
                          return AnnouncementCard(announcement: announcement);
                        },
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AnnouncementCard extends StatelessWidget {
  final Announcement announcement;

  const AnnouncementCard({super.key, required this.announcement});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15.0),
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Colors.white.withOpacity(0.95),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AnnouncementDetailPage(announcement: announcement),
            ),
          );
        },
        borderRadius: BorderRadius.circular(15),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      announcement.title,
                      style: const TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1A237E),
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Chip(
                    label: Text(announcement.category, style: const TextStyle(fontSize: 12, color: Colors.white)),
                    backgroundColor: getCategoryColor(announcement.category, context), // Bu satırda değişiklik yapıldı
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              if (announcement.imageUrl != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Hero(
                    tag: 'announcement-image-${announcement.id}',
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        announcement.imageUrl!,
                        height: 150,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: 150,
                            width: double.infinity,
                            color: Colors.grey[300],
                            child: Icon(Icons.broken_image, size: 50, color: Colors.grey[600]),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              Text(
                announcement.content,
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${announcement.author} - ${announcement.publishDate.day}.${announcement.publishDate.month}.${announcement.publishDate.year}',
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                  const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}