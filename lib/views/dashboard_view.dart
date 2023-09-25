import 'package:ewalletapp/Utilities/sizes_config.dart';
import 'package:ewalletapp/Views_Models/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/ewalletDrawer.dart';
import '../widgets/moneyButton.dart';
import '../widgets/transactionTile.dart';
import '../Models/dummy_data.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<AuthViewModel>(
        builder: (context, value, child) => Scaffold(
          //TODO: add a new way to display the drawer
          // drawer: ewalletDrawer(
          //   logout: logout,
          // ),
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
                          InkWell(
                            //!  onTap: _openDrawer,
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/images/avatar.png"),
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            value.currentUser!.userName,
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
                    const Text(
                      '\$1,234.56',
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
                  onPressed: () =>
                      Provider.of<AuthViewModel>(context, listen: false)
                          .signOut(),
                  child: const Text('تسجيل الخروج'))
            ],
          ),
        ),
      ),
    );
  }
}
