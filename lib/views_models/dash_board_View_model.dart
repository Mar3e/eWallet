import 'package:flutter/material.dart';

import '../Models/user.dart';
import '../repositories/auth_repo/auth_repository.dart';

class DashBoardViewModel extends ChangeNotifier {
  final AuthRepository _authRepository;

  DashBoardViewModel(this._authRepository);

  get name => "moew";
}
