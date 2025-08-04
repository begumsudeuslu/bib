import 'package:flutter/material.dart';
import 'my_calendar.dart'; // CalendarPage'inizin doğru yolu
import 'about_us_page.dart'; // Yeni AboutUsPage'inizin yolu
import 'projects_page.dart';


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
      home: const BIBPage(), // Ana ekranı BIBPage olarak belirliyoruz
    );
  }
}

// --- _DashboardView ve diğer yardımcı widget'larınız buraya gelecek ---
// (Daha önceki yanıtlarda verdiğim _DashboardView, _buildInfoCard, _buildActivityCard kodlarını buraya ekleyin)
// ...
// --- _DashboardView sınıfı buraya gelecek ---
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

          // --- Yeni Hakkımızda Bölümü Başlangıcı ---
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
              // Tıklanabilir olması için InkWell kullandık
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
          // --- Yeni Hakkımızda Bölümü Sonu ---
        ],
      ),
    );
  }

  // Bilgi Kartı Oluşturma Fonksiyonu
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

// --- BIBPage sınıfı buradan başlıyor ---
class BIBPage extends StatefulWidget {
  const BIBPage({super.key});

  @override
  State<BIBPage> createState() => _BIBPageState();
}

class _BIBPageState extends State<BIBPage> {
  int _selectedIndex = 0; // Alttaki navigasyon çubuğu için seçili indeks

  // Modüllerin listesi - Takvim ve Projeler burada yer almıyor çünkü Navigator.push ile açılıyor
  // BottomNavigationBarItem sırasına göre düzenlendi:
  // 0: Dashboard, 1: Takvim (Push ediliyor), 2: Projeler (Push ediliyor), 3: Mesajlar, 4: Duyurular, 5: İK, 6: Hakkımızda
  static const List<Widget> _widgetOptions = <Widget>[
    _DashboardView(), // Index 0: Dashboard
    Text('Mesajlaşma ve İletişim Modülü Buraya Gelecek', // Index 1 (BNB 3. indeks: Mesajlar)
        style: TextStyle(fontSize: 24, color: Colors.black)),
    Text('Duyurular Modülü Buraya Gelecek', // Index 2 (BNB 4. indeks: Duyurular)
        style: TextStyle(fontSize: 24, color: Colors.black)),
    Text('İK Modülü Buraya Gelecek', // Index 3 (BNB 5. indeks: İK)
        style: TextStyle(fontSize: 24, color: Colors.black)),
    AboutUsPage(), // Index 4: Hakkımızda (BNB 6. indeks: Hakkımızda)
  ];

  void _onItemTapped(int index) {
    if (index == 1) { // Eğer tıklanan indeks "Takvim" ise (BottomNavigationBar'da 1. indeks)
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CalendarPage()),
      );
    } else if (index == 2) { // Eğer tıklanan indeks "Projeler" ise (BottomNavigationBar'da 2. indeks)
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ProjectsPage()),
      );
    }
    else {
      // Diğer menü öğeleri için _widgetOptions listesinden ilgili sayfayı göster.
      // _widgetOptions listesinin indeksleri, BottomNavigationBar'daki fiziksel indekslerle
      // Takvim ve Projeler'in araya girmesi nedeniyle farklılık gösterir.
      int targetWidgetIndex = index;
      if (index > 1) { // Eğer tıklanan indeks Takvim'den sonra geliyorsa, indeksini 1 azalt
        targetWidgetIndex = index - 1;
      }
      if (index > 2) { // Eğer tıklanan indeks Projeler'den sonra geliyorsa, indeksini 1 daha azalt
        targetWidgetIndex = index - 2;
      }
      setState(() {
        _selectedIndex = targetWidgetIndex;
      });
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
        backgroundColor: Colors.transparent, // AppBar'ı şeffaf yapıldı
        elevation: 0, // Gölge kaldırıldı
        iconTheme: const IconThemeData(color: Colors.white), // Geri butonu rengi
      ),
      extendBodyBehindAppBar: true, // AppBar'ın arkasına body'nin uzanmasını sağlar
      body: Stack(
        children: [
          // Premium arka plan: gradient + blur daireler
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
          SafeArea(
            child: Center(
              child: _widgetOptions.elementAt(_selectedIndex),
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
            icon: Icon(Icons.calendar_today), // Takvim ikonu (Index 1)
            label: 'Takvim',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business_center), // Projeler ikonu (Index 2)
            label: 'Projeler',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message), // Mesajlar ikonu (Index 3)
            label: 'Mesajlar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.campaign), // Duyurular ikonu (Index 4)
            label: 'Duyurular',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people), // İK ikonu (Index 5)
            label: 'İK',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info), // Hakkımızda ikonu (Index 6)
            label: 'Hakkımızda',
          ),
        ],
        // Buradaki _selectedIndex, sadece _widgetOptions içindeki sekmeler için doğrudur.
        // Takvim ve Projeler açıldığında, BottomNavigationBar'daki görsel seçili ikon
        // değişmeyebilir, çünkü _selectedIndex değeri o an değişmez.
        // Bu durum, 'push' ile açılan sayfaların 'ana' BottomNavigationBar'ın kontrolünde olmamasından kaynaklanır.
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.white70,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF0D47A1),
      ),
    );
  }
}