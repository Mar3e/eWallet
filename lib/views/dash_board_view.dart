import 'package:ewalletapp/Core/Constants/colors_consts.dart';
import 'package:ewalletapp/views_models/dash_board_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../views_models/auth_view_model.dart';

class DashBoardView extends StatelessWidget {
  const DashBoardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer2<AuthViewModel, DashBoardViewModel>(
        builder: (_, authViewModel, dashBoardViewModel, __) => Scaffold(
          key: dashBoardViewModel.scaffoldKey,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  child: Row(
                    children: [
                      Container(
                        width: 55,
                        height: 55,
                        decoration: ShapeDecoration(
                          image: const DecorationImage(
                            image: AssetImage("assets/images/avatar.png"),
                            fit: BoxFit.fill,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                      Column(
                        children: [
                          const Text('مرحباً'),
                          Text(authViewModel.currentUser!.userName),
                        ],
                      ),
                    ],
                  ),
                  // subtitleTextStyle: TextStyle(fontSize: 15),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
