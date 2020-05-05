import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel{
  String _title = "Home Screen";
  String get title => "$_title | $_counter";

  int _counter = 0;
  int get counter => _counter;

  void updateCounter(){
    _counter++;
    notifyListeners();
  }
}