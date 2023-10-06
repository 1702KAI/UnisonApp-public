import 'package:flutter/material.dart';

class AuthModel extends ChangeNotifier{
  bool _isAuth = false;
  bool get isLogin{
    return _isAuth;
  }
  void loginSuccess(){
    _isAuth = true;
    notifyListeners();
  }
}