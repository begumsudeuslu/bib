import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'homePage/login_page.dart'; // Yeni oluşturduğumuz giriş sayfasını import ediyoruz

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        textTheme: GoogleFonts.quicksandTextTheme(),
      ),
      home: const LoginPage(), // Uygulama başlangıcını giriş sayfası olarak ayarlıyoruz.
      debugShowCheckedModeBanner: false,
    );
  }
}