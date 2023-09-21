import 'package:flutter/material.dart';
import 'views/dashboard_view.dart';
import 'views/login.dart';
import 'views/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _loggedIn = false;

  void login() {
    setState(() {
      _loggedIn = !_loggedIn;
    });
  }

  void logout() {
    setState(() {
      _loggedIn = !_loggedIn;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: _loggedIn ? DashboardView() : Login(login: login),
    );
  }
}
