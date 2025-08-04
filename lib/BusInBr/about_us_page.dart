import 'package:flutter/material.dart';
import 'employee_list_page.dart';
import 'package:url_launcher/url_launcher.dart'; // Konum için dış bağlantı açmak için

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hakkımızda',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF0D47A1),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Stack(
        children: [
          // Arka plan gradienti ve daireler
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
          // İçerik
          SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text(
                  'BİZ KİMİZ?',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A237E),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'BIB Yazılım A.Ş. olarak, geleceğin dijital dünyasını şekillendiren öncü teknoloji çözümleri sunuyoruz. Yüksek kaliteli yazılım ürünleri geliştirerek, işletmelerin verimliliğini artırmayı ve dijitalleşme süreçlerini kolaylaştırmayı hedefliyoruz.',
                  style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                ),
                const SizedBox(height: 30),

                // --- Tamamlanmış Projeler Bölümü ---
                const Text(
                  '✅ Tamamlanmış Projeler',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A237E),
                  ),
                ),
                const SizedBox(height: 10),
                _buildProjectItem('Kurumsal CRM Sistemi', 'Büyük ölçekli firmalar için müşteri ilişkileri yönetim çözümü.'),
                _buildProjectItem('Mobil Bankacılık Uygulaması', 'Güvenli ve kullanıcı dostu mobil bankacılık platformu.'),
                _buildProjectItem('E-Ticaret Entegrasyon Çözümü', 'Farklı e-ticaret altyapılarıyla entegre çalışan sistem.'),
                _buildProjectItem('Yapay Zeka Destekli Analiz Platformu', 'Veri analizi ve raporlama için akıllı platform.'),
                const SizedBox(height: 30),

                // --- Konum Bilgisi Bölümü ---
                const Text(
                  '📍 Konumumuz',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A237E),
                  ),
                ),
                const SizedBox(height: 10),
                _buildContactInfo(Icons.location_on, 'Adres', 'Örnek Mah. Örnek Cad. No: 123, Çankaya/Ankara'),
                _buildLaunchableLink(
                  context,
                  'Haritada Göster',
                  'https://www.google.com/maps/search/?api=1&query=Ankara+%C3%87ankaya+%C3%96rnek+Mah.+%C3%96rnek+Cad.+No:+123',
                  Icons.map,
                ),
                const SizedBox(height: 10),
                _buildContactInfo(Icons.phone, 'Telefon', '+90 (312) 123 45 67'),
                _buildContactInfo(Icons.email, 'E-posta', 'info@bibyazilim.com'),
                const SizedBox(height: 30),

                // --- Çalışan Listesi Yönlendirme Kartı ---
                const Text(
                  '👥 Çalışanlarımız',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A237E),
                  ),
                ),
                const SizedBox(height: 10),
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  color: Colors.white.withOpacity(0.95),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EmployeeListPage()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          const Icon(Icons.group, size: 30, color: Color(0xFF0D47A1)),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Ekibimizle Tanışın',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF1A237E),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Yetenekli ve deneyimli ekibimizi keşfedin.',
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
                const SizedBox(height: 30),

                Center(
                  child: Text(
                    '© ${DateTime.now().year} BIB Yazılım A.Ş. Tüm Hakları Saklıdır.', // Yıl dinamikleştirildi
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Yeni proje listesi öğesi oluşturma metodu
  Widget _buildProjectItem(String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check_circle_outline, size: 28, color: Colors.green),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A237E),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Mevcut iletişim bilgisi metodu
  Widget _buildContactInfo(IconData icon, String title, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 28, color: const Color(0xFF0D47A1)),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A237E),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  content,
                  style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Harita bağlantısı için yeni metot
  Widget _buildLaunchableLink(BuildContext context, String text, String url, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: () async {
          if (await canLaunchUrl(Uri.parse(url))) {
            await launchUrl(Uri.parse(url));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Bağlantı açılamadı: $url')),
            );
          }
        },
        child: Row(
          children: [
            Icon(icon, size: 28, color: const Color(0xFF0D47A1)),
            const SizedBox(width: 15),
            Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xFF0D47A1),
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}