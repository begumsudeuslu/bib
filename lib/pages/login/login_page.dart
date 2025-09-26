import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proje_adi/viewmodels/login_viewmodel.dart';
import '../home/home_page.dart';
import 'create_user_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'forgot_password/forgot_password_page.dart';
import '../../widgets/login_widgets/text_field_section.dart';
import 'package:provider/provider.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController(); // E-posta için controller
    final TextEditingController passwordController = TextEditingController();

    final viewModel =context.watch<LoginViewModel>();

    void loginAttempt() async {
      final success = await viewModel.login(emailController.text, passwordController.text);

      if(success) {
        if(context.mounted)   {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const HomePage()));
        }
      } else  {
        if(context.mounted&& viewModel.errorMessage!=null)  {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(viewModel.errorMessage!), backgroundColor: Colors.red,));
          viewModel.clearError(); //gösterildikten sonra sıfırlandı
        }
      }
    }

    return Scaffold(
      body: Stack(
        children: [
          // Gradient Arka Plan
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF6A9EC4),
                  Color(0xFFB0C4DE),
                  Color(0xFF8A9FD1),
                ],
              ),
            ),
          ),
          // Baloncuk Efektleri
          Positioned(
            top: -60,
            left: -60,
            child: Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.2),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF6A9EC4).withOpacity(0.3),
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
                color: Colors.white.withOpacity(0.15),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF8A9FD1).withOpacity(0.3),
                    blurRadius: 60,
                    spreadRadius: 20,
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Container(
                width: 400,
                padding: const EdgeInsets.all(32.0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2), // Yarı saydam arka plan
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 20,
                      spreadRadius: 5,
                    ),
                  ],
                  border: Border.all(
                    color: Colors.white.withOpacity(0.3),
                    width: 2,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Hoş Geldiniz',
                      style: GoogleFonts.quicksand(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            color: Colors.black.withOpacity(0.2),
                            offset: const Offset(1, 1),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    TextFieldSection(
                      controller: emailController,
                      hintText: 'E-posta',
                      icon: Icons.email,
                    ),
                    const SizedBox(height: 16),
                    TextFieldSection(
                      controller: passwordController,
                      hintText: 'Şifre',
                      icon: Icons.lock,
                      obscureText: true,
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: viewModel.isLoading?null:loginAttempt,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white.withOpacity(0.8),
                          foregroundColor: const Color(0xFF6A9EC4),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 5,
                        ),
                        child: Text(
                          'Giriş Yap',
                          style: GoogleFonts.quicksand(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Şifremi Unuttum bağlantısı
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ForgotPasswordPage()),
                        );
                      },
                      child: Text(
                        'Şifremi Unuttum',
                        style: GoogleFonts.quicksand(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              color: Colors.black.withOpacity(0.3),
                              offset: const Offset(1, 1),
                              blurRadius: 3,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Yeni Hesap Oluştur bağlantısı
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const CreateUserPage()),
                        );
                      },
                      child: Text(
                        'Yeni Hesap Oluştur',
                        style: GoogleFonts.quicksand(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              color: Colors.black.withOpacity(0.3),
                              offset: const Offset(1, 1),
                              blurRadius: 3,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}