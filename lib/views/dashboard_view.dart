import 'package:flutter/material.dart';
import '../widgets/ewalletDrawer.dart';
import '../widgets/moneyButton.dart';
import '../widgets/transactionTile.dart';
import '../Models/dummy_data.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

 

  
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
     //TODO: add a new way to display the drawer
      // drawer: ewalletDrawer(
      //   logout: logout,
      // ),
      body: SingleChildScrollView(
        child: Column(
          //  crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              width: double.infinity,
              height: screenHeight * 0.32,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      stops: [
                    0.0,
                    0.7,
                  ],
                      colors: [
                    Color.fromRGBO(255, 200, 195, 1),
                    Color.fromRGBO(75, 156, 211, 1),
                  ])),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(
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
                          'مرعي بن طالب',
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
              height: screenHeight * 0.03,
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
              height: screenHeight * 0.366,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListView.builder(
                  itemCount: userTransactions.length,
                  itemBuilder: (BuildContext context, index) {
                    return TransactionTile(
                      transaction: userTransactions[index],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
