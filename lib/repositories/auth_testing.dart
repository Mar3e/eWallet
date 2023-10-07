import 'dart:developer';

import '../Models/user.dart';
import 'auth_repository.dart';

class AuthTesting extends AuthRepository {
  late User _currentUser;

  get currentUser => _currentUser;

  @override
  Future<User> getUser(String userEmail, String userPassword) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      User user = users.firstWhere(
        (element) =>
            element.userEmail == userEmail &&
            element.userPassword == userPassword,
      );
      _currentUser = user;
      return user;
    } catch (e) {
      log("$e");
      rethrow;
    }
  }

  @override
  Future<User> addUser(String userName, String userEmail, int userPhone,
      String userPassword) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      users.add(User(
          userId: users.length,
          userName: userName,
          userPassword: userPassword,
          userEmail: userEmail,
          userPhone: userPhone));

      return users.last;
    } catch (e) {
      rethrow;
    }
  }
}

Map<String, dynamic> usersWallets = {
  "يمني": 12000.0,
  "دولار": 120.0,
  "سعودي": 300.0
};

var users = <User>[
  User(
      userId: 132,
      userName: "مرعي بن طالب",
      userPassword: "1111",
      userEmail: "mar@gmail.com",
      userPhone: 773627506,
      wallets: usersWallets,
      profilePic: "assets/images/man.png"),
  User(
      userId: 123,
      userName: "أحمد باشنيني",
      userPassword: "2222",
      userEmail: "bash@gmail.com",
      userPhone: 789456123,
      wallets: usersWallets,
      profilePic: "assets/images/gamer.png"),
  User(
      userId: 369,
      userName: "معاذ مبيروك",
      userPassword: "3333",
      userEmail: "moath@gmail.com",
      userPhone: 321654987,
      wallets: usersWallets,
      profilePic: "assets/images/avatar.png"),
];
