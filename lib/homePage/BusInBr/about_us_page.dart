import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'employee_list_page.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            backgroundColor: Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                'Hakkımızda',
                style: GoogleFonts.quicksand(
                  color: Colors.blueGrey[800],
                  fontWeight: FontWeight.w700,
                  fontSize: 22,
                ),
              ),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.blueGrey[100]!,
                      Colors.blueGrey[200]!,
                    ],
                  ),
                ),
              ),
            ),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_rounded, 
                color: Colors.blueGrey[800],
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                // Şirket Tanıtımı
                _buildSectionCard(
                  title: 'BİZ KİMİZ?',
                  content: 'BIB Yazılım A.Ş. olarak, geleceğin dijital dünyasını şekillendiren öncü teknoloji çözümleri sunuyoruz. Yüksek kaliteli yazılım ürünleri geliştirerek, işletmelerin verimliliğini artırmayı ve dijitalleşme süreçlerini kolaylaştırmayı hedefliyoruz.',
                  icon: Icons.business_rounded,
                ),

                const SizedBox(height: 20),

                // Tamamlanmış Projeler
                _buildSectionTitle('✅ Tamamlanmış Projeler'),
                const SizedBox(height: 10),
                _buildProjectItem('Kurumsal CRM Sistemi', 'Büyük ölçekli firmalar için müşteri ilişkileri yönetim çözümü.'),
                _buildProjectItem('Mobil Bankacılık Uygulaması', 'Güvenli ve kullanıcı dostu mobil bankacılık platformu.'),
                _buildProjectItem('E-Ticaret Entegrasyon Çözümü', 'Farklı e-ticaret altyapılarıyla entegre çalışan sistem.'),
                _buildProjectItem('Yapay Zeka Destekli Analiz Platformu', 'Veri analizi ve raporlama için akıllı platform.'),

                const SizedBox(height: 20),

                // İletişim Bilgileri
                _buildSectionTitle('📍 Konumumuz'),
                const SizedBox(height: 10),
                _buildContactInfo(Icons.location_on_rounded, 'Adres', 'Örnek Mah. Örnek Cad. No: 123, Çankaya/Ankara'),
                _buildLaunchableLink(
                  context,
                  'Haritada Göster',
                  'https://www.google.com/maps/search/?api=1&query=Ankara+%C3%87ankaya+%C3%96rnek+Mah.+%C3%96rnek+Cad.+No:+123',
                  Icons.map_rounded,
                ),
                _buildContactInfo(Icons.phone_rounded, 'Telefon', '+90 (312) 123 45 67'),
                _buildContactInfo(Icons.email_rounded, 'E-posta', 'info@bibyazilim.com'),

                const SizedBox(height: 20),

                // Çalışanlar Bölümü
                _buildSectionTitle('👥 Çalışanlarımız'),
                const SizedBox(height: 10),
                _buildEmployeeCard(context),

                const SizedBox(height: 30),

                // Telif Hakkı
                Center(
                  child: Text(
                    '© ${DateTime.now().year} BIB Yazılım A.Ş. Tüm Hakları Saklıdır.',
                    style: GoogleFonts.quicksand(
                      fontSize: 14, 
                      color: Colors.blueGrey[600],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.quicksand(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: Colors.blueGrey[800],
      ),
    );
  }

  Widget _buildSectionCard({
    required String title,
    required String content,
    required IconData icon,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey.withOpacity(0.1),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blueGrey[100],
            boxShadow: [
              BoxShadow(
                color: Colors.blueGrey.withOpacity(0.2),
                blurRadius: 8,
                spreadRadius: 2,
              )
            ],
          ),
          child: Icon(
            icon, 
            color: Colors.blueGrey[700], 
            size: 28,
          ),
        ),
        title: Text(
          title,
          style: GoogleFonts.quicksand(
            fontWeight: FontWeight.w700,
            color: Colors.blueGrey[800],
            fontSize: 18,
          ),
        ),
        subtitle: Text(
          content,
          style: GoogleFonts.quicksand(
            color: Colors.blueGrey[600],
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildProjectItem(String title, String description) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey.withOpacity(0.1),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.green.withOpacity(0.1),
            boxShadow: [
              BoxShadow(
                color: Colors.green.withOpacity(0.2),
                blurRadius: 8,
                spreadRadius: 2,
              )
            ],
          ),
          child: Icon(
            Icons.check_circle_outline_rounded, 
            color: Colors.green[700], 
            size: 24,
          ),
        ),
        title: Text(
          title,
          style: GoogleFonts.quicksand(
            fontWeight: FontWeight.w700,
            color: Colors.blueGrey[800],
            fontSize: 18,
          ),
        ),
        subtitle: Text(
          description,
          style: GoogleFonts.quicksand(
            color: Colors.blueGrey[600],
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildContactInfo(IconData icon, String title, String content) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey.withOpacity(0.1),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blueGrey[100],
            boxShadow: [
              BoxShadow(
                color: Colors.blueGrey.withOpacity(0.2),
                blurRadius: 8,
                spreadRadius: 2,
              )
            ],
          ),
          child: Icon(
            icon, 
            color: Colors.blueGrey[700], 
            size: 24,
          ),
        ),
        title: Text(
          title,
          style: GoogleFonts.quicksand(
            fontWeight: FontWeight.w700,
            color: Colors.blueGrey[800],
            fontSize: 18,
          ),
        ),
        subtitle: Text(
          content,
          style: GoogleFonts.quicksand(
            color: Colors.blueGrey[600],
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildLaunchableLink(BuildContext context, String text, String url, IconData icon) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey.withOpacity(0.1),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blueGrey[100],
            boxShadow: [
              BoxShadow(
                color: Colors.blueGrey.withOpacity(0.2),
                blurRadius: 8,
                spreadRadius: 2,
              )
            ],
          ),
          child: Icon(
            icon, 
            color: Colors.blueGrey[700], 
            size: 24,
          ),
        ),
        title: Text(
          text,
          style: GoogleFonts.quicksand(
            color: Colors.blueGrey[700],
            fontWeight: FontWeight.w700,
            decoration: TextDecoration.underline,
          ),
        ),
        onTap: () async {
          if (await canLaunchUrl(Uri.parse(url))) {
            await launchUrl(Uri.parse(url));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Bağlantı açılamadı: $url')),
            );
          }
        },
      ),
    );
  }

  Widget _buildEmployeeCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey.withOpacity(0.1),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
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
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blueGrey[100],
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueGrey.withOpacity(0.2),
                        blurRadius: 8,
                        spreadRadius: 2,
                      )
                    ],
                  ),
                  child: Icon(
                    Icons.groups_rounded, 
                    color: Colors.blueGrey[700], 
                    size: 28,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ekibimizle Tanışın',
                        style: GoogleFonts.quicksand(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.blueGrey[800],
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Yetenekli ve deneyimli ekibimizi keşfedin.',
                        style: GoogleFonts.quicksand(
                          fontSize: 14,
                          color: Colors.blueGrey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded, 
                  size: 20, 
                  color: Colors.blueGrey[600]
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}