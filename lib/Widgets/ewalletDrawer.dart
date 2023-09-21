import 'package:flutter/material.dart';
import '../views/profile.dart';

class ewalletDrawer extends StatelessWidget {
  Function logout;
  ewalletDrawer({super.key, required this.logout});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
                child: Column(
              children: const [
                Center(
                  child: CircleAvatar(
                      radius: 40.0,
                      backgroundImage: AssetImage("assets/images/avatar.png")),
                ),
                Text(
                  "مرعي بن طالب",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Divider(
                  thickness: 3.0,
                  color: Color.fromRGBO(255, 200, 195, 1),
                ),
              ],
            )),
            ListTile(
              leading: const Icon(Icons.manage_accounts_rounded),
              title: const Text(
                'إدارة الحساب',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Profile()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text(
                'تسجيل الخروج',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                logout();
              },
            ),
          ],
        ),
      ),
    );
  }
}
