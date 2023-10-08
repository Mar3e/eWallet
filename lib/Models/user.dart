class User {
  int userId;
  String userName;
  String userPassword;
  String userEmail;
  int userPhone;
  String? profilePic;
  Map<String, double>? wallets;

  User(
      {required this.userId,
      required this.userName,
      required this.userPassword,
      required this.userEmail,
      required this.userPhone,
      this.wallets,
      this.profilePic});
}
