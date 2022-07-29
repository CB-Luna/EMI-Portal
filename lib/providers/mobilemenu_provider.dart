import 'package:flutter/material.dart';

class MenuProvider with ChangeNotifier {
  double opener = 0;
  dynamic _menuData;
  dynamic get menuData => _menuData;

  getMenuData(menuData) {
    _menuData = menuData;
    notifyListeners();
  }

  void closeMenu() {
    opener = 0;
    notifyListeners();
  }

  void openMenu() {
    opener = 1;
    notifyListeners();
  }
}
