import 'package:ewalletapp/Core/Utilities/navigators.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../views_models/auth_view_model.dart';
import '../../views_models/dash_board_view_model.dart';
import '../profile_view.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<AuthViewModel, DashBoardViewModel>(
        builder: (_, authViewModel, dashBoardViewModel, __) => Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    child: Column(
                      children: [
                        Center(
                          child: CircleAvatar(
                              radius: 40.0,
                              backgroundImage: AssetImage(
                                  authViewModel.currentUser.profilePic)),
                        ),
                        Text(
                          authViewModel.currentUser.userName,
                          style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.manage_accounts_rounded),
                    title: const Text(
                      'إدارة الحساب',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    onTap: () => goToProfileView(context),
                  ),
                  ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text(
                      'تسجيل الخروج',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    onTap: () => authViewModel.signOut(),
                  ),
                ],
              ),
            ));
  }
}
