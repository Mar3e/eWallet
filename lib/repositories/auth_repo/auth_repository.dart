import '../../Models/user.dart';

abstract class AuthRepository {
  Future<User> getUser(String userEmail, String userPassword);
  Future<User> addUser(
      String userName, String userEmail, int userPhone, String userPassword);
}
