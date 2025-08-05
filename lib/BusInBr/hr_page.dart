import 'package:flutter/material.dart';

class HrPage extends StatelessWidget {
  const HrPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('İnsan Kaynakları (İK)'),
        backgroundColor: const Color(0xFF0D47A1), // AppBar rengi
        iconTheme: const IconThemeData(color: Colors.white), // Geri butonu rengi
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.people,
                size: 80,
                color: Color(0xFF0D47A1),
              ),
              const SizedBox(height: 20),
              const Text(
                'İK Modülü',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A237E),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Bu sayfada maaş bordroları, izin takibi, şirket duyuruları gibi İK süreçlerini takip edebilirsiniz.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}