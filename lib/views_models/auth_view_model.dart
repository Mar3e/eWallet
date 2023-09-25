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
  final _signInFormKey = GlobalKey<FormState>();
  final _signUpFormKey = GlobalKey<FormState>();
  final TextEditingController _passWordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  User? get currentUser => _currentUser;
  bool get isSigned => _isSigned;
  bool get obscureText => _obscureText;
  get signInFormKey => _signInFormKey;
  get signUpFormKey => _signUpFormKey;
  get passWordController => _passWordController;
  get emailController => _emailController;
  get phoneController => _phoneController;
  get nameController => _nameController;

  void toggleObscureText() {
    _obscureText = !_obscureText;
    notifyListeners();
  }

  Future<bool> signIn() async {
    try {
      if (signInFormValidator()) {
        final user = await _authRepository.getUser(
            _emailController.text, _passWordController.text);
        if (user != null) {
          _currentUser = user;
          _isSigned = true;
          print(_currentUser!.userName);
          notifyListeners();
          return true; // Sign-in successful
        } else {
          debugPrint("no user found"); // User not found
          return false;
        }
      } else {
        return true;
      }
    } catch (e) {
      debugPrint('Sign-in error: $e');
      return false; // Sign-in failed
    }
  }

  Future<bool> signUp() async {
    try {
      if (signUpFormValidator()) {
        final newUser = await _authRepository.addUser(
            _nameController.text,
            _emailController.text,
            int.parse(_phoneController.text),
            _passWordController.text);
        if (newUser != null) {
          _currentUser = newUser;
          _isSigned = true;
          print(_currentUser!.userName);
          notifyListeners();
          return true;
        } else {
          return false;
        }
      } else {
        return true;
      }

      // Sign-up successful
    } catch (e) {
      debugPrint('Sign-up error: $e');
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
  String? userNameValidator() => notEmpty(_nameController.text);
  String? phoneValidator() => validatePhone(_phoneController.text);

  bool signInFormValidator() {
    bool isValid = _signInFormKey.currentState!.validate();
    return isValid;
  }

  bool signUpFormValidator() {
    bool isValid = _signUpFormKey.currentState!.validate();
    return isValid;
  }
}
