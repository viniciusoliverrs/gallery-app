import 'package:flutter/material.dart';

abstract class BaseController extends ChangeNotifier {
  bool isLoading = false;
  String messageFailure = '';


  setIsLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  setMessageFailure(String value) {
    messageFailure = value;
    notifyListeners();
  }
}