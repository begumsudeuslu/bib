// lib/BusInBr/employee_directory_page.dart

import 'package:flutter/material.dart';

class EmployeeDirectoryPage extends StatelessWidget {
  const EmployeeDirectoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Personel Rehberi',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF0D47A1),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.people,
                size: 80,
                color: Color(0xFF0D47A1),
              ),
              SizedBox(height: 20),
              Text(
                'Personel Rehberi Modülü',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A237E),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Bu sayfada tüm şirket çalışanlarının iletişim bilgilerini bulabilirsiniz. Detaylı liste ve arama özelliği buraya eklenecek.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}