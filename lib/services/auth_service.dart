import 'package:proje_adi/models/login_credentials.dart';

// firebase veya herhangi bir api'a bağlanacak
abstract class IAuthService  {
  Future<bool> login(LoginCredentials credentials);
  Future<void> logout();

}


// firebase bağlayana kadar mock olarak çalıştırılsın
class MockAuthService implements IAuthService  {
  Future<T> _simulateDelay<T>(T result)=> Future.delayed(const Duration(seconds:1), ()=>result);

  @override
  Future<bool> login(LoginCredentials credentials) async  {
    // burası daha sonra değişecek
    if (credentials.email == 'test@sirket.com' && credentials.password == '123456') {
      return _simulateDelay(true);
    } else {
      throw Exception('E-posta veya şifre hatalı.');
    }
  }

  @override
  Future<void> logout() {
    return _simulateDelay(null);
  }
}