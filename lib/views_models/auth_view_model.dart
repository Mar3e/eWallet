import 'package:ewalletapp/Models/user.dart';
import 'package:ewalletapp/repositories/auth_repo/auth_repository.dart';
import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier{
final AuthRepository _authRepository;

  AuthViewModel(this._authRepository);

  User? _currentUser;
  bool _isSigned = false;

  User? get currentUser => _currentUser;
  bool get isSigned => _isSigned;


Future<bool> signIn(String email, String password) async {
    try {
      final user = await _authRepository.getUser(email, password);
      if (user != null) {
        _currentUser = user;
        _isSigned = true;
        notifyListeners();
        return true; // Sign-in successful
      } else {
        return false; // User not found
      }
    } catch (e) {
      print('Sign-in error: $e');
      return false; // Sign-in failed
    }
  }

   Future<bool> signUp(String userName, String userEmail, int userPhone, String userPassword) async {
    try {
   
      final newUser = await _authRepository.addUser(userName, userEmail, userPhone, userPassword);

      _currentUser = newUser;
       _isSigned = true;
      notifyListeners();
      return true; // Sign-up successful
    } catch (e) {
      print('Sign-up error: $e');
      return false; // Sign-up failed
    }
  }

  void signOut() {
    _currentUser = null;
    _isSigned = false;
    notifyListeners();
  }
}

