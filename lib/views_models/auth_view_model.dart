import 'package:ewalletapp/Models/user.dart';
import 'package:ewalletapp/repositories/auth_repo/auth_repository.dart';
import 'package:flutter/material.dart';

import '../Utilities/validators.dart';

// This view model are used for the both of signIn and signUp views for simplicity
class AuthViewModel extends ChangeNotifier {
  final AuthRepository _authRepository;

  AuthViewModel(this._authRepository);

  User? _currentUser;
  bool _isSigned = false;
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _passWordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  User? get currentUser => _currentUser;
  bool get isSigned => _isSigned;
  bool get obscureText => _obscureText;
  get formKey => _formKey;
  get passWordController => _passWordController;
  get emailController => _emailController;

  void toggleObscureText() {
    _obscureText = !_obscureText;
    notifyListeners();
  }

  Future<bool> signIn() async {
    try {
      if (formValidator()) {
        final user = await _authRepository.getUser(
            _emailController.text, _passWordController.text);
        if (user != null) {
          _currentUser = user;
          _isSigned = true;
          notifyListeners();
          return true; // Sign-in successful
        } else {
          print("no user found"); // User not found
          return false;
        }
      } else {
        return true;
      }
    } catch (e) {
      print('Sign-in error: $e');
      return false; // Sign-in failed
    }
  }

  Future<bool> signUp(String userName, String userEmail, int userPhone,
      String userPassword) async {
    try {
      final newUser = await _authRepository.addUser(
          userName, userEmail, userPhone, userPassword);

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

  //validators

  String? emailValidator() => validateEmail(_emailController.text);
  String? passWordValidator() => notEmpty(_passWordController.text);

  bool formValidator() {
    bool isValid = _formKey.currentState!.validate();
    return isValid;
  }
}
