import 'package:flutter/material.dart';
import 'package:proje_adi/repositories/auth_repository.dart';

class StartupViewModel extends ChangeNotifier{
  final AuthRepository _repository;

  StartupViewModel({required AuthRepository authRepository}): _repository =authRepository;

  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  Future<void> checkLoginStatus() async {
    _isLoading = true;
    notifyListeners();
    _isLoggedIn = await _repository.isLoggedIn();
    _isLoading = false;
    notifyListeners();
  }

}