import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proje_adi/pages/home/home_page.dart';
import 'package:proje_adi/repositories/auth_repository.dart';
import 'package:proje_adi/services/auth_service.dart';
import 'package:proje_adi/viewmodels/login_viewmodel.dart';
import 'package:proje_adi/viewmodels/startup_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:proje_adi/pages/login/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // service'leri oluştur
  final IAuthService authService=MockAuthService();  //firebase'den sonra değiştirilecek

  // repositoryleri oluştur ve serviceleri koy
  final AuthRepository authRepository=AuthRepository(authService: authService);

  // isLoggedIn'i kontrol eden viewModel, uygulama başlarken ilk kontrolü yapar
  final StartupViewModel startupViewModel = StartupViewModel(authRepository: authRepository);
  await startupViewModel.checkLoginStatus(); // check

  runApp(MyApp(
    authRepository: authRepository,
    startupViewModel:startupViewModel,
  ));
}

class MyApp extends StatelessWidget {
  final AuthRepository authRepository;
  final StartupViewModel startupViewModel;
  const MyApp({super.key, required this.authRepository, required this.startupViewModel});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>LoginViewModel(repository: authRepository),),
        ChangeNotifierProvider.value(value: startupViewModel,),
      ],
      child: MaterialApp(
        title: 'BIB Yazılım',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
          textTheme: GoogleFonts.quicksandTextTheme(),
        ),
        home:const StartupWrapper(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}


// başlangıçta hangi sayfaya gideceğine karar veren widget
class StartupWrapper extends StatelessWidget  {
  const StartupWrapper({super.key});

  @override
  Widget build(BuildContext context)  {
    final startupViewModel=context.watch<StartupViewModel>();

    if(startupViewModel.isLoading)   {
      // while loading, shoow loading screen
      return const Scaffold(
        body: Center(child: CircularProgressIndicator(),),
      );
    } else  {
      return startupViewModel.isLoggedIn?const HomePage(): const LoginPage();
    }
  }
}