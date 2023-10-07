import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'repositories/auth_testing.dart';
import './views_models/auth_view_model.dart';
import './views/dash_board_view.dart';
import './views/signin_view.dart';

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
          )
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
                  value.isSigned ? const DashBoardView() : const SignInView(),
            ),
          ),
        ),
      ),
    );
  }
}
