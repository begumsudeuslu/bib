import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'homePage/login_page.dart';
import 'homePage/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // shared_preferences nesnesini alıyoruz
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  runApp(MyApp(isLoggedIn: isLoggedIn));
}
class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BIB Yazılım',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        textTheme: GoogleFonts.quicksandTextTheme(),
      ),
      home: isLoggedIn ? const HomePage() : const LoginPage(), // Bu satır kritik!
      debugShowCheckedModeBanner: false,
    );
  }
}