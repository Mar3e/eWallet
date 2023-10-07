import 'package:flutter/material.dart';

class DashBoardViewModel extends ChangeNotifier {
  DashBoardViewModel();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  get scaffoldKey => _scaffoldKey;

  void openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }
}
