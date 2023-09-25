import 'package:flutter/material.dart';

import '../Views/signup_view.dart';

void goToSignUpView(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const SignUpView(),
    ),
  );
}
