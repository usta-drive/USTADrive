import 'package:flutter/material.dart';

class Registration {
  Registration({this.firstName,this.lastName,this.email,this.password,this.address,this.geneder,this.isInstructer, this.isStudent,this.phoneNumber});
  String firstName;
  String lastName;
  String email;
  String password;
  String address ;
  String geneder;
  bool isStudent, isInstructer;
  String phoneNumber;
}