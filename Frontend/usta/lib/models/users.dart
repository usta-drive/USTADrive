import 'package:flutter/material.dart';
import 'package:usta/services/login_api.dart';

class Users {


  Users(this._id, this._userName, this._firstName, this._lastName,
      this._password, this._phone, this._email, this._gender, this._age,
      this._userPhoto, this._address1, this._address2, this._cityName,
      this._stateName, this._zipCode, this._userType, this._userRole,
      this._securityQuestion, this._flag);

  int _id;
  String _userName;
  String _firstName;

  int get id => _id;
  String _lastName;
  String _password;
  String _phone;
  String _email;
  String _gender;
  int _age;
  String _userPhoto;
  String _address1;
  String _address2;
  String _cityName;
  String _stateName;
  int _zipCode;
  String _userType;
  String _userRole;
  String _securityQuestion;
  String _flag;




  String get userName => _userName;

  String get firstName => _firstName;

  String get lastName => _lastName;

  String get password => _password;

  String get phone => _phone;

  String get email => _email;

  String get gender => _gender;

  int get age => _age;

  String get userPhoto => _userPhoto;

  String get address1 => _address1;

  String get address2 => _address2;

  String get cityName => _cityName;

  String get stateName => _stateName;

  int get zipCode => _zipCode;

  String get userType => _userType;

  String get userRole => _userRole;

  String get securityQuestion => _securityQuestion;

  String get flag => _flag;


}
