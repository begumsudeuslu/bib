import 'package:flutter/material.dart';
import 'my_calendar.dart';
import 'about_us_page.dart';
import 'projects_page.dart';
import 'announcements_page.dart';
import 'messages_page.dart'; // Mesajlar sayfası için
import 'hr_page.dart'; // İK sayfası için

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BIB Yazılım',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const BIBPage(),
    );
  }
}

// --- _DashboardView ve diğer yardımcı widget'larınız aynı kalacak ---
class _DashboardView extends StatelessWidget {
  const _DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'BIB Yazılım A.Ş.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A237E),
              letterSpacing: 1.5,
              shadows: [
                Shadow(
                    color: Colors.black26, offset: Offset(2, 2), blurRadius: 4),
              ],
            ),
          ),
          const SizedBox(height: 20),
          _buildInfoCard(
            title: 'Ortak Vizyonumuz',
            content:
                'Geleceğin teknolojilerini şekillendiren, inovasyon odaklı ve sürdürülebilir bir kurum kültürü oluşturmak.',
            icon: Icons.lightbulb_outline,
          ),
          const SizedBox(height: 15),
          _buildInfoCard(
            title: 'Kurum İçi Slogan',
            content: '"Birlikte Büyüyoruz, Geleceği Şekillendiriyoruz!"',
            icon: Icons.star_border,
          ),
          const SizedBox(height: 15),
          Text(
            '📌 Son Gelişmeler',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1A237E),
              shadows: [
                Shadow(
                    color: Colors.black.withOpacity(0.3),
                    offset: Offset(1, 1),
                    blurRadius: 3),
              ],
            ),
          ),
          const SizedBox(height: 10),
          _buildActivityCard(
            icon: Icons.email,
            title: 'Yeni Mesajlar',
            description: '3 okunmamış mesajınız var. (Proje X ve Duyuru Y hakkında)',
            color: Colors.blue.shade100,
          ),
          const SizedBox(height: 8),
          _buildActivityCard(
            icon: Icons.announcement,
            title: 'Yeni Duyurular',
            description: 'İdari Karar: Yeni Ofis Düzenlemesi ve Eğitim Serisi Başlıyor.',
            color: Colors.green.shade100,
          ),
          const SizedBox(height: 8),
          _buildActivityCard(
            icon: Icons.event,
            title: 'Yaklaşan Etkinlikler',
            description:
                'Takım Toplantısı (05.08.2025, 14:00) ve İnovasyon Workshop (10.08.2025).',
            color: Colors.orange.shade100,
          ),
          const SizedBox(height: 8),
          _buildActivityCard(
            icon: Icons.work,
            title: 'Yeni Projeler',
            description: 'Yeni "AI Destekli Analiz Platformu" projesi başlatıldı.',
            color: Colors.purple.shade100,
          ),
          const SizedBox(height: 13),
          Text(
            'ℹ️ Hakkımızda',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1A237E),
              shadows: [
                Shadow(
                    color: Colors.black.withOpacity(0.3),
                    offset: Offset(1, 1),
                    blurRadius: 3),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            color: Colors.white.withOpacity(0.95),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutUsPage()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    const Icon(Icons.info_outline, size: 30, color: Color(0xFF0D47A1)),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Şirketimiz Hakkında',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1A237E),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Vizyonumuzu, misyonumuzu ve hikayemizi keşfedin.',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios, size: 20, color: Colors.grey),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildInfoCard(
      {required String title, required String content, required IconData icon}) {
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
            Icon(icon, size: 30, color: const Color(0xFF1A237E)),
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
                      color: const Color(0xFF1A237E),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[800],
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
// --- BIBPage sınıfı yeniden düzenlenmiş hali ---
class BIBPage extends StatefulWidget {
  const BIBPage({super.key});

  @override
  State<BIBPage> createState() => _BIBPageState();
}

class _BIBPageState extends State<BIBPage> {
  // Artık _selectedIndex'e ihtiyacımız yok
  // int _selectedIndex = 0;

  // _widgetOptions listesine de gerek yok
  // static const List<Widget> _widgetOptions = <Widget>[...];

  void _onItemTapped(int index) {
    Widget? page;
    switch (index) {
      case 0: // Dashboard
        // Dashboard ana sayfa olduğu için bir şey yapmıyoruz, zaten buradayız
        return;
      case 1: // Takvim
        page = const CalendarPage();
        break;
      case 2: // Projeler
        page = const ProjectsPage();
        break;
      case 3: // Mesajlar
        page = const MessagesPage();
        break;
      case 4: // Duyurular
        page = const AnnouncementsPage();
        break;
      case 5: // İK
        page = const HrPage();
        break;
      case 6: // Hakkımızda
        page = const AboutUsPage();
        break;
    }
    
    // Sadece Dashboard dışındaki tüm butonlar için yeni bir sayfa aç
    if (page != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => page!),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BIB Yazılım A.Ş. Kurumsal Uygulama',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      extendBodyBehindAppBar: true,
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
          // Ana ekran sadece Dashboard olacak
          const SafeArea(
            child: Center(
              child: _DashboardView(),
            ),
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
            icon: Icon(Icons.business_center),
            label: 'Projeler',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Mesajlar',
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
        // Şu an hangi butona basılırsa basılsın, _selectedIndex değeri 0 kalacak.
        // Çünkü tüm sayfalar yeni bir ekran olarak açılıyor.
        currentIndex: 0,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.white70,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF0D47A1),
      ),
    );
  }
}