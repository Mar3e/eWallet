import 'package:ewalletapp/Core/Constants/colors_consts.dart';
import 'package:ewalletapp/Core/Utilities/sizes_config.dart';
import 'package:ewalletapp/Core/Utilities/spacres.dart';
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
        builder: (_, authViewModel, dashBoardViewModel, __) => LayoutBuilder(
          builder: (context, constraints) {
            SizesConfig().init(constraints);
            print(
                "${SizesConfig.widthMultiplier}  ${SizesConfig.heightMultiplier}");
            return Scaffold(
              key: dashBoardViewModel.scaffoldKey,
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 55,
                                height: 55,
                                decoration: ShapeDecoration(
                                  image: const DecorationImage(
                                    image:
                                        AssetImage("assets/images/avatar.png"),
                                    fit: BoxFit.fill,
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                ),
                              ),
                              addHorizontalSpace(10.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('مرحباً'),
                                  Text(authViewModel.currentUser!.userName),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            width: 36,
                            height: 36,
                            decoration: ShapeDecoration(
                              color: LightColors.secondaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            child: Icon(Icons.notifications),
                          ),
                        ],
                      ),
                      // subtitleTextStyle: TextStyle(fontSize: 15),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
