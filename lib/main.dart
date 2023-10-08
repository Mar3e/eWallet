import 'package:ewalletapp/repositories/auth_repository.dart';
import 'package:ewalletapp/views_models/dash_board_view_model.dart';
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
    //Specify form where the data comes form
    AuthRepository dataRepo = AuthTesting();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => AuthViewModel(dataRepo),
          ),
          ChangeNotifierProvider(
            create: (context) => DashBoardViewModel(),
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
