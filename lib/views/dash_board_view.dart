import 'dart:ffi';

import 'package:ewalletapp/views/Widgets/drawer_widget.dart';
import 'package:ewalletapp/views_models/dash_board_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/dummy_data.dart';
import 'Widgets/moneyButton.dart';
import 'Widgets/transactionTile.dart';
import '../views_models/auth_view_model.dart';

class DashBoardView extends StatelessWidget {
  const DashBoardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer2<AuthViewModel, DashBoardViewModel>(
        builder: (_, authViewModel, dashBoardViewModel, __) => Scaffold(
          key: dashBoardViewModel.scaffoldKey,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            leading: InkWell(
              onTap: dashBoardViewModel.openDrawer,
              child: CircleAvatar(
                backgroundImage:
                    AssetImage(authViewModel.currentUser.profilePic),
              ),
            ),
          ),
          drawer: const DrawerWidget(),
          body: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                width: double.infinity,
                height: 200,
                decoration:
                    BoxDecoration(color: Theme.of(context).colorScheme.primary),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            authViewModel.currentUser.userName,
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'يوجد في حسابك',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      authViewModel.currentUser.wallets["يمني"].toString(),
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MoneyButton(
                          text: "ارسل",
                          color: const Color.fromRGBO(75, 156, 211, 0.916),
                        ),
                        const SizedBox(
                          width: 50.0,
                        ),
                        MoneyButton(
                          text: "استلم",
                          color: const Color.fromRGBO(255, 200, 195, 0.805),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  ' الوصول السريع',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              // Container(
              //   padding: const EdgeInsets.all(20.0),
              //   width: double.infinity,
              //   height: screenHeight * 0.2,
              //   child: ListView.builder(
              //       scrollDirection: Axis.horizontal,
              //       itemCount: users.length,
              //       itemBuilder: (BuildContext context, index) {
              //         return InkWell(
              //           onTap: () {},
              //           child: Card(
              //             child: SizedBox(
              //               width: 100,
              //               height: 10,
              //               child: Column(
              //                 children: [
              //                   Image.asset(
              //                     //TODO fix this
              //                     users[index].profilePic?? "null",
              //                     scale: 18,
              //                   ),
              //                   Text(users[index].userName)
              //                 ],
              //               ),
              //             ),
              //           ),
              //         );
              //       }),
              // ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'سجل العمليات',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 200,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ListView.builder(
                    itemCount: userTransactions.length,
                    itemBuilder: (BuildContext context, index) {
                      return TransactionTile(
                        transaction: userTransactions[index],
                      );
                    }),
              ),
              ElevatedButton(
                  onPressed: () => authViewModel.signOut(),
                  child: const Text('تسجيل الخروج'))
            ],
          ),
        ),
      ),
    );
  }
}
