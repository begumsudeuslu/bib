import 'package:flutter/material.dart';
import 'package:proje_adi/models/login_credentials.dart';
import 'package:proje_adi/repositories/auth_repository.dart';

class LoginViewModel extends ChangeNotifier {
  final AuthRepository _repository;

  LoginViewModel({required AuthRepository repository}): _repository=repository;

  // view
  bool _isLoading= false;
  bool get isLoading =>_isLoading;

  String? _errorMessage;
  String? get errorMessage=>_errorMessage;

  Future<bool> login(String email, String password) async  {
    _isLoading=true;
    _errorMessage=null;
    notifyListeners();

    try {
      final credentials=LoginCredentials(email: email, password: password);
      await _repository.attemptLogin(credentials);
      return true;

    } catch (e)  {
      _errorMessage=e is Exception?e.toString().replaceFirst('Exception: ', ''): 'unknown error is occured.';
      return false;
    }

    finally {
      _isLoading=false;
      notifyListeners();
    }
  }

  // refresh the error message
  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}