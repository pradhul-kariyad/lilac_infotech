import 'package:flutter/material.dart';

class BottomBarProvider extends ChangeNotifier {
  int _selectedPageIndex = 0;

  int get selectedPageIndex => _selectedPageIndex;

  void updateSelectedPageIndex(int index) {
    _selectedPageIndex = index;
    notifyListeners();
  }
}
