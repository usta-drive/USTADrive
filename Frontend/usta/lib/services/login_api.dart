import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:usta/models/users.dart';
import 'package:usta/models/http_exception.dart';

class UserLoginAPI {
  Future<Users> fetchUser(String email, String password) async {
    Users user;
    final url = 'http://localhost:8080/usta/api/login/${email}/${password}';
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final extractedData =
            json.decode(response.body) as Map<String, dynamic>;
        if (extractedData == null) {
          return Future.value(null);
        }
        print(
            'login_api.dart#fetchUser: extractedData from http://localhost:8080/usta/api/login $extractedData ');
        user = Users(
            extractedData['id'],
            extractedData['userName'].toString(),
            extractedData['firstName'].toString(),
            extractedData['lastName'].toString(),
            extractedData['usrPassword'].toString(),
            extractedData['phone'].toString(),
            extractedData['email'].toString(),
            extractedData['gender'].toString(),
            extractedData['age'],
            extractedData['userPhoto'].toString(),
            extractedData['address1'].toString(),
            extractedData['address2'].toString(),
            extractedData['cityName'].toString(),
            extractedData['stateName'].toString(),
            extractedData['zipCode'],
            extractedData['userType'].toString(),
            extractedData['userRole'].toString(),
            extractedData['securityQuestion'].toString(),
            extractedData['flag'].toString());

        return Future.value(user);
      } else if (response.statusCode == 401) {
        if (response.body.toString() == 'Ivalid username/password') {
          throw HttpException('UserName or Password is incorrect');
        } else {
          throw HttpException('UserName not Register!');
        }
      } else if (response.statusCode == 500) {
        throw HttpException('Server Error :(');
      }
    } catch (error) {
      print(
          'login_api.dart#fetchUser: ERROR from http://localhost:8080/usta/api/login $error ');
    }
  }
}
