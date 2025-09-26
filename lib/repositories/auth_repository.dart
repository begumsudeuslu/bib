import 'package:proje_adi/models/login_credentials.dart';
import 'package:proje_adi/services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {

  final IAuthService _authService;

  AuthRepository({required IAuthService authService}) : _authService=authService;

  Future<void> attemptLogin(LoginCredentials credentials) async {
    final bool success=await _authService.login(credentials);  //giriş işlemi service'a yaptırıldı

    if(success)  {
      final prefs=await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
    }  // hata zaten service'da fırlatılmıştı
  }

  Future<bool> isLoggedIn() async  {
    final prefs=await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn')?? false;
  } 

}