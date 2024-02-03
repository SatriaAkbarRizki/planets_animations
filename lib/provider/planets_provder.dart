import 'package:flutter/material.dart';

class PlanetsProvider with ChangeNotifier {
  int indexPage = 0;
  bool isShow = false;

  void changePage(int index) {
    indexPage = index;
    notifyListeners();
  }

  void showingName(bool show) {
    isShow = show;
    notifyListeners();
  }
}
