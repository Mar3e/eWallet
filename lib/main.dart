import 'package:ewalletapp/repositories/auth_repo/auth_testing.dart';
import 'package:ewalletapp/views_models/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Views/dashboard_view.dart';
import 'Views/signin_view.dart';
import 'Views/signup_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => AuthViewModel(AuthTesting()),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.cyan,
          ),
          home: Directionality(
            textDirection: TextDirection.rtl,
            child: Consumer<AuthViewModel>(
              builder: (context, value, child) =>
                  value.isSigned ? DashboardView() : SignInView(),
            ),
          ),
        ),
      ),
    );
  }
}
