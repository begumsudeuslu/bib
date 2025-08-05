import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'bottom_navigation.dart';
import 'messages_page.dart'; // Mesajlar sayfasını import ettik
//import 'hr_page.dart'; // İK sayfası için gerekli

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
        textTheme: GoogleFonts.quicksandTextTheme(),
      ),
      home: const BIBPage(),
    );
  }
}

class _DashboardView extends StatelessWidget {
  const _DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'BIB Yazılım A.Ş.',
            style: GoogleFonts.quicksand(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1A237E),
              letterSpacing: 1.5,
              shadows: [
                Shadow(
                  color: Colors.black26, 
                  offset: const Offset(2, 2), 
                  blurRadius: 4
                ),
              ],
            ),
            textAlign: TextAlign.center,
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
            style: GoogleFonts.quicksand(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1A237E),
              shadows: [
                Shadow(
                  color: Colors.black.withOpacity(0.3),
                  offset: const Offset(1, 1),
                  blurRadius: 3
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          _buildActivityCard(
            context,
            icon: Icons.email,
            title: 'Yeni Mesajlar',
            description: '3 okunmamış mesajınız var. (Proje X ve Duyuru Y hakkında)',
            color: Colors.blue.shade100,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MessagesPage()),
              );
            },
          ),
          const SizedBox(height: 8),
          _buildActivityCard(
            context,
            icon: Icons.announcement,
            title: 'Yeni Duyurular',
            description: 'İdari Karar: Yeni Ofis Düzenlemesi ve Eğitim Serisi Başlıyor.',
            color: Colors.green.shade100,
            onTap: () {
              // Yönlendirme eklenebilir
            },
          ),
          const SizedBox(height: 8),
          _buildActivityCard(
            context,
            icon: Icons.event,
            title: 'Yaklaşan Etkinlikler',
            description:
                'Takım Toplantısı (05.08.2025, 14:00) ve İnovasyon Workshop (10.08.2025).',
            color: Colors.orange.shade100,
            onTap: () {
              // Yönlendirme eklenebilir
            },
          ),
          const SizedBox(height: 8),
          _buildActivityCard(
            context,
            icon: Icons.work,
            title: 'Yeni Projeler',
            description: 'Yeni "AI Destekli Analiz Platformu" projesi başlatıldı.',
            color: Colors.purple.shade100,
            onTap: () {
              // Yönlendirme eklenebilir
            },
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard({
    required String title,
    required String content,
    required IconData icon,
  }) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: const Color(0xFF0D47A1),
              size: 30,
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.quicksand(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1A237E),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    content,
                    style: GoogleFonts.quicksand(
                      fontSize: 16,
                      color: Colors.grey[700],
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
  
  Widget _buildActivityCard(BuildContext context, {
    required IconData icon,
    required String title,
    required String description,
    required Color color,
    VoidCallback? onTap, // onTap özelliği eklendi
  }) {
    return InkWell( // Kartı tıklanabilir yapmak için InkWell ile sardık
      onTap: onTap,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        color: color,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                icon,
                size: 30,
                color: const Color(0xFF1A237E),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.quicksand(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1A237E),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      description,
                      style: GoogleFonts.quicksand(
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
      ),
    );
  }
}

// Bu kısım, önceki kodunuzda eksik veya yanlış tanımlanmıştı.
// BIBPage sınıfı, bir StatefulWidget olmalı ve bir durum (state) yaratmalıdır.
class BIBPage extends StatefulWidget {
  const BIBPage({super.key});

  @override
  State<BIBPage> createState() => _BIBPageState();
}

class _BIBPageState extends State<BIBPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'BIB Yazılım A.Ş. Kurumsal Uygulama',
          style: GoogleFonts.quicksand(
            color: Colors.white, 
            fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Stack(
        children: [
          // Gradient Background
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
          // Decorative Circles
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
          // Main Dashboard Content
          const SafeArea(
            child: Center(
              child: _DashboardView(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BIBBottomNavigationBar(),
    );
  }
}