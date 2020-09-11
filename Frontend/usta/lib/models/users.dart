import 'package:flutter/material.dart';

class Users {
  String userName;
  String password;


  bool isAuthenticated() {
    if (this.userName == 'a' && this.password == 'a') {
      return true;
    } else {
      return false;
    }
  }
}