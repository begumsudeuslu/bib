import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proje_adi/widgets/about_us_page_widgets/employee_card_section.dart';
import '../../../../widgets/about_us_page_widgets/title_section.dart';
import '../../../../widgets/about_us_page_widgets/card_section.dart';
import '../../../../widgets/about_us_page_widgets/project_item_section.dart';
import '../../../../widgets/about_us_page_widgets/contact_info_section.dart';
import '../../../../widgets/about_us_page_widgets/launchable_link_section.dart';

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
                CardSection(
                  title: 'BİZ KİMİZ?',
                  content:
                      'BIB Yazılım A.Ş. olarak, geleceğin dijital dünyasını şekillendiren öncü teknoloji çözümleri sunuyoruz. Yüksek kaliteli yazılım ürünleri geliştirerek, işletmelerin verimliliğini artırmayı ve dijitalleşme süreçlerini kolaylaştırmayı hedefliyoruz.',
                  icon: Icons.business_rounded,
                ),

                const SizedBox(height: 20),

                // Tamamlanmış Projeler
                SectionTitle(title: '✅ Tamamlanmış Projeler'),

                const SizedBox(height: 10),

                ProjectItemSection(
                    title: 'Kurumsal CRM Sistemi',
                    description:
                        'Büyük ölçekli firmalar için müşteri ilişkileri yönetim çözümü.'),
                ProjectItemSection(
                    title: 'Mobil Bankacılık Uygulaması',
                    description:
                        'Güvenli ve kullanıcı dostu mobil bankacılık platformu.'),
                ProjectItemSection(
                    title: 'E-Ticaret Entegrasyon Çözümü',
                    description:
                        'Farklı e-ticaret altyapılarıyla entegre çalışan sistem.'),
                ProjectItemSection(
                    title: 'Yapay Zeka Destekli Analiz Platformu',
                    description:
                        'Veri analizi ve raporlama için akıllı platform.'),

                const SizedBox(height: 20),

                // İletişim Bilgileri
                SectionTitle(title: '📍 Konumumuz'),
                const SizedBox(height: 10),

                ContactInfoSection(
                    icon: Icons.location_on_rounded,
                    title: 'Adres',
                    content: 'Örnek Mah. Örnek Cad. No: 123, Çankaya/Ankara'),

                LaunchableLinkSection(
                  text: 'Haritada Göster',
                  url:
                      'https://www.google.com/maps/search/?api=1&query=Ankara+%C3%87ankaya+%C3%96rnek+Mah.+%C3%96rnek+Cad.+No:+123',
                  icon: Icons.map_rounded,
                ),

                ContactInfoSection(
                    icon: Icons.phone_rounded,
                    title: 'Telefon',
                    content: '+90 (312) 123 45 67'),
                ContactInfoSection(
                    icon: Icons.email_rounded,
                    title: 'E-posta',
                    content: 'info@bibyazilim.com'),

                const SizedBox(height: 20),

                // Çalışanlar Bölümü
                SectionTitle(title: '👥 Çalışanlarımız'),
                const SizedBox(height: 10),
                EmployeeCardSection(),

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
}
