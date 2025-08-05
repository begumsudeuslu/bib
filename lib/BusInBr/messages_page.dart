import 'package:flutter/material.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mesajlar'),
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
                Icons.message,
                size: 80,
                color: Color(0xFF0D47A1),
              ),
              const SizedBox(height: 20),
              const Text(
                'Mesajlar Modülü',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A237E),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Bu sayfada kişisel ve grup mesajlarınızı yönetebilirsiniz. İleride sohbet listesi ve detay sayfası buraya eklenecek.',
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