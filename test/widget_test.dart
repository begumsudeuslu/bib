import 'package:flutter/material.dart';

class BIBPage extends StatefulWidget {
  const BIBPage({super.key});

  @override
  State<BIBPage> createState() => _BIBPageState();
}

class _BIBPageState extends State<BIBPage> {
  int _selectedIndex = 0; // Alttaki navigasyon çubuğu için seçili indeks

  static const List<Widget> _widgetOptions = <Widget>[
    _DashboardView(),
    Text('Takvim ve Zaman Yönetimi Modülü Buraya Gelecek', style: TextStyle(fontSize: 24, color: Colors.white)),
    Text('Projeler ve İş Takibi Modülü Buraya Gelecek', style: TextStyle(fontSize: 24, color: Colors.white)),
    Text('Mesajlaşma ve İletişim Modülü Buraya Gelecek', style: TextStyle(fontSize: 24, color: Colors.white)),
    Text('Doküman Yönetimi Modülü Buraya Gelecek', style: TextStyle(fontSize: 24, color: Colors.white)),
    Text('Duyurular Modülü Buraya Gelecek', style: TextStyle(fontSize: 24, color: Colors.white)),
    Text('İK Modülü Buraya Gelecek', style: TextStyle(fontSize: 24, color: Colors.white)),
    Text('Kurum Tanıtım Sayfası Modülü Buraya Gelecek', style: TextStyle(fontSize: 24, color: Colors.white)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BIB Yazılım A.Ş. Kurumsal Uygulama',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent, // AppBar'ı şeffaf yapıldı ki alttaki gradient görünsün
        elevation: 0, // Gölge kaldırıldı
        iconTheme: const IconThemeData(color: Colors.white), // Geri butonu rengi
      ),
      extendBodyBehindAppBar: true, // AppBar'ın arkasına body'nin uzanmasını sağlar
      body: Stack(
        children: [
          // Premium arka plan: gradient + blur daireler (HomePage'den alındı)
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFe0e7ff), // Açık mavi tonu
                  Color(0xFFf8fafc), // Neredeyse beyaz
                  Color(0xFFc7d2fe), // Morumsu mavi tonu
                ],
              ),
            ),
          ),
          // Dekoratif blur efektli daireler (HomePage'den alındı)
          Positioned(
            top: -60,
            left: -60,
            child: Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blueAccent.withOpacity(0.18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueAccent.withOpacity(0.25),
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
                color: Colors.deepPurpleAccent.withOpacity(0.13),
                boxShadow: [
                  BoxShadow(
                    color: Colors.deepPurpleAccent.withOpacity(0.18),
                    blurRadius: 60,
                    spreadRadius: 20,
                  ),
                ],
              ),
            ),
          ),
          // İçerik
          Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Takvim',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Projeler',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Mesajlar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.folder),
            label: 'Dokümanlar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.campaign),
            label: 'Duyurular',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'İK',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Hakkımızda',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.white70,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed, // Daha fazla item için kaydırmayı engeller
        backgroundColor: const Color(0xFF0D47A1), // BottomBar rengi
      ),
    );
  }
}

// --- Dashboard Görünümü ---
class _DashboardView extends StatelessWidget {
  const _DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Kurum Logoları ve Başlık
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image.asset('assets/bib_logo.png', height: 80), // BIB Logosu
              // Eğer logonuz varsa burayı kullanabilirsiniz.
              const Text(
                'BIB Yazılım A.Ş.',
                textAlign: TextAlign.center, // Metni ortala
                style: TextStyle(
                  fontSize: 32, // Daha büyük font boyutu
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A237E), // Renk gradient ile uyumlu hale getirildi
                  letterSpacing: 1.5, // Harfler arasında boşluk
                  shadows: [
                    Shadow(color: Colors.black26, offset: Offset(2, 2), blurRadius: 4), // Daha belirgin gölge
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          // Ortak Vizyon ve Slogan
          _buildInfoCard(
            title: 'Ortak Vizyonumuz',
            content: 'Geleceğin teknolojilerini şekillendiren, inovasyon odaklı ve sürdürülebilir bir kurum kültürü oluşturmak.',
            icon: Icons.lightbulb_outline,
          ),
          const SizedBox(height: 20),
          _buildInfoCard(
            title: 'Kurum İçi Slogan',
            content: '"Birlikte Büyüyoruz, Geleceği Şekillendiriyoruz!"',
            icon: Icons.star_border,
          ),
          const SizedBox(height: 30),

          // Son Gelişmeler Bölümü
          Text(
            '📌 Son Gelişmeler',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1A237E), // Renk gradient ile uyumlu hale getirildi
              shadows: [
                Shadow(color: Colors.black.withOpacity(0.3), offset: Offset(1, 1), blurRadius: 3),
              ],
            ),
          ),
          const SizedBox(height: 15),

          _buildActivityCard(
            icon: Icons.email,
            title: 'Yeni Mesajlar',
            description: '3 okunmamış mesajınız var. (Proje X ve Duyuru Y hakkında)',
            color: Colors.blue.shade100, // Daha açık tonlar kullanıldı
          ),
          const SizedBox(height: 10),
          _buildActivityCard(
            icon: Icons.announcement,
            title: 'Yeni Duyurular',
            description: 'İdari Karar: Yeni Ofis Düzenlemesi ve Eğitim Serisi Başlıyor.',
            color: Colors.green.shade100, // Daha açık tonlar kullanıldı
          ),
          const SizedBox(height: 10),
          _buildActivityCard(
            icon: Icons.event,
            title: 'Yaklaşan Etkinlikler',
            description: 'Takım Toplantısı (05.08.2025, 14:00) ve İnovasyon Workshop (10.08.2025).',
            color: Colors.orange.shade100, // Daha açık tonlar kullanıldı
          ),
          const SizedBox(height: 10),
          _buildActivityCard(
            icon: Icons.work,
            title: 'Yeni Projeler',
            description: 'Yeni "AI Destekli Analiz Platformu" projesi başlatıldı.',
            color: Colors.purple.shade100, // Daha açık tonlar kullanıldı
          ),
          const SizedBox(height: 30),

          // "Kime Ulaşmalıyım?" Kartları
          Text(
            '🎯 Kime Ulaşmalıyım?',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1A237E), // Renk gradient ile uyumlu hale getirildi
              shadows: [
                Shadow(color: Colors.black.withOpacity(0.3), offset: Offset(1, 1), blurRadius: 3),
              ],
            ),
          ),
          const SizedBox(height: 15),
          _buildContactCard(
            context,
            name: 'Ayşe Yılmaz',
            role: 'İK Sorumlusu',
            email: 'ayse.yilmaz@bib.com',
            phone: '+90 5XX XXX XX XX',
          ),
          const SizedBox(height: 10),
          _buildContactCard(
            context,
            name: 'Mehmet Demir',
            role: 'Proje Yöneticisi',
            email: 'mehmet.demir@bib.com',
            phone: '+90 5XX XXX XX XX',
          ),
          const SizedBox(height: 10),
          _buildContactCard(
            context,
            name: 'Zeynep Kara',
            role: 'İletişim Uzmanı',
            email: 'zeynep.kara@bib.com',
            phone: '+90 5XX XXX XX XX',
          ),
        ],
      ),
    );
  }

  // Bilgi Kartı Oluşturma Fonksiyonu
  static Widget _buildInfoCard({required String title, required String content, required IconData icon}) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Colors.white.withOpacity(0.9),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: const Color(0xFF0D47A1), size: 28),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A237E),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              content,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Aktivite Kartı Oluşturma Fonksiyonu (Son Gelişmeler İçin)
  static Widget _buildActivityCard({
    required IconData icon,
    required String title,
    required String description,
    required Color color,
  }) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 30, color: const Color(0xFF1A237E)), // İkon rengi temaya uyarlandı
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1A237E), // Metin rengi temaya uyarlandı
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[800], // Metin rengi temaya uyarlandı
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // İletişim Kartı Oluşturma Fonksiyonu ("Kime Ulaşmalıyım?" İçin)
  static Widget _buildContactCard(
    BuildContext context, {
    required String name,
    required String role,
    required String email,
    required String phone,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.white.withOpacity(0.95),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 30,
              backgroundColor: Color(0xFF0D47A1),
              child: Icon(Icons.person, color: Colors.white, size: 30),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A237E),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    role,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: () {
                      // Email gönderme veya kopyalama işlevi eklenebilir
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('$email adresine e-posta gönderme düşünülüyor.')),
                      );
                    },
                    child: Row(
                      children: [
                        const Icon(Icons.email, size: 16, color: Color(0xFF0D47A1)), // İkon rengi temaya uyarlandı
                        const SizedBox(width: 5),
                        Text(
                          email,
                          style: const TextStyle(fontSize: 13, color: Color(0xFF0D47A1), decoration: TextDecoration.underline), // Metin rengi temaya uyarlandı
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  GestureDetector(
                    onTap: () {
                      // Telefon arama işlevi eklenebilir
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('$phone numarası aranıyor...')),
                      );
                    },
                    child: Row(
                      children: [
                        const Icon(Icons.phone, size: 16, color: Color(0xFF0D47A1)), // İkon rengi temaya uyarlandı
                        const SizedBox(width: 5),
                        Text(
                          phone,
                          style: const TextStyle(fontSize: 13, color: Color(0xFF0D47A1), decoration: TextDecoration.underline), // Metin rengi temaya uyarlandı
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}