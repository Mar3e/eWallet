// This view model are used for the both of signIn and signUp views for simplicity
import 'package:flutter/material.dart';

import '../Models/user.dart';
import '../Core/Utilities/validators.dart';
import '../repositories/auth_repository.dart';

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
  get currentUser => _currentUser;
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
    User user;
    if (signInFormValidator()) {
      user = await _authRepository.getUser(
          emailController.text, passWordController.text);
      _isSigned = true;
      _currentUser = user;
      notifyListeners();
      return false;
    } else {
      return true;
    }
  }

  void signOut() {
    _currentUser = null;
    _nameController.clear();
    _phoneController.clear();
    _emailController.clear();
    _passWordController.clear();
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
