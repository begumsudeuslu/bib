import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'information/founding&history.dart';
import 'information/affiliation_structure.dart';
import 'information/services_activities.dart';

class SKPage extends StatelessWidget {
  const SKPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Renkler
    const blue = Color(0xFF5393F5);
    const dark = Color(0xFF102A32);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 24),
              // Kuruluş Amacı ve Tarihi Başlığı
              Text(
                foundingTitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: blue,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 32),
              // Kuruluş Amacı ve Tarihi Açıklama
              Text(
                foundingDescription,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: dark,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1,
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 48),
              // Bağlı Olduğu Kurum ve Yapı Başlığı
              Text(
                affiliationTitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: blue,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.3,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 28),
              // Bağlı Olduğu Kurum ve Yapı Açıklama
              Text(
                affiliationDescription,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: dark,
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1,
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 48),
              // Faaliyet Alanları ve Hizmetler Başlığı
              Text(
                servicesTitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: blue,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.3,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 28),
              // Faaliyet Alanları ve Hizmetler Açıklama
              Text(
                servicesDescription,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: dark,
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1,
                  height: 1.6,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}