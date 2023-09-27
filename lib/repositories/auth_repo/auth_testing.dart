import 'package:ewalletapp/Models/user.dart';
import 'package:ewalletapp/repositories/auth_repo/auth_repository.dart';

class AuthTesting extends AuthRepository {
  @override
  Future<User?> getUser(String userEmail, String userPassword) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      User user = users.firstWhere(
        (element) =>
            element.userEmail == userEmail &&
            element.userPassword == userPassword,
      );

      return user;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<User?> addUser(String userName, String userEmail, int userPhone,
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
      return null;
    }
  }
}

var users = <User>[
  User(
      userId: 132,
      userName: "مرعي بن طالب",
      userPassword: "1111",
      userEmail: "mar@gmail.com",
      userPhone: 773627506,
      profilePic: "assets/images/avatar.png"),
  User(
      userId: 123,
      userName: "أحمد باشنيني",
      userPassword: "2222",
      userEmail: "bash@gmail.com",
      userPhone: 789456123,
      profilePic: "assets/images/avatar.png"),
  User(
      userId: 369,
      userName: "معاذ مبيروك",
      userPassword: "3333",
      userEmail: "moath@gmail.com",
      userPhone: 321654987,
      profilePic: "assets/images/avatar.png"),
];
