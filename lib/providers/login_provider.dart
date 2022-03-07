import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier{

  late String _email;
  late String _password;

  final formKey = GlobalKey<FormState>();
  late bool _autovalidate = false;
  bool _isVisible = true;

  String get email => _email;
  String get password => _password;
  bool get autovalidateMode => _autovalidate;
  bool get isVisible => _isVisible;

  void set autovalidate(bool value){
    _autovalidate = value;
    notifyListeners();
  }

  void set isVisible(bool value){
    _isVisible = value;
    notifyListeners();
  }

  void onSaveEmail(String emailString){
    _email = emailString;
    notifyListeners();
  }

  void onSavePassword(String passwordString){
    _password = passwordString;
    notifyListeners();
  }

  String? validateEmail(String value){
    String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(p);

    if (value.isEmpty) {
      return "Please enter the email";
    } else if (!regExp.hasMatch(value)) {
      return "Please enter valid email";
    } else {
      return null;
    }
  }

  String? validatePassword(String value){
    if(value.isEmpty){
      return "Please enter the password";
    }else if(value.length < 6){
      return "Password must contain 6 characters";
    }else{
      return null;
    }
  }

}