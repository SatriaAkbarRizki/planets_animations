import 'package:flutter/material.dart';

class PlanetsProvider with ChangeNotifier{
  int indexPage = 0;

  void changePage(int index){
    indexPage = index;
    notifyListeners();
  }
}