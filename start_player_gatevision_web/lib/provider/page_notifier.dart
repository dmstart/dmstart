import 'package:flutter/material.dart';

class LoginOrRegister extends ChangeNotifier{
  bool _isLogin = true;

  bool get isLogin => _isLogin;

  void toggle(){
    _isLogin = !_isLogin;
    notifyListeners();
  }
}