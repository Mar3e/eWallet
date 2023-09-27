import 'package:ewalletapp/Models/user.dart';
import 'package:ewalletapp/repositories/auth_repo/auth_repository.dart';
import 'package:flutter/material.dart';

import '../Utilities/validators.dart';

// This view model are used for the both of signIn and signUp views for simplicity
class AuthViewModel extends ChangeNotifier {
  final AuthRepository _authRepository;

  AuthViewModel(this._authRepository);

  bool _isSigned = false;
  bool _obscureText = true;
  final _signInFormKey = GlobalKey<FormState>();
  final _signUpFormKey = GlobalKey<FormState>();
  final TextEditingController _passWordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

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

  void toggleSignIn(bool value) {
    _isSigned = value;
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
