import 'package:flutter/material.dart';

import '../../views/profile_view.dart';
import '../../views/signup_view.dart';

void goToSignUpView(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const SignUpView(),
    ),
  );
}

void goToProfileView(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const ProfileView(),
    ),
  );
}
