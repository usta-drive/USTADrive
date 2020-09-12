import 'package:flutter/material.dart';
import 'package:usta/common/constants/colors.dart';
import 'package:usta/screens/navigation/navigation_bloc.dart';

class MyAccount extends StatefulWidget  with NavigationStates {
  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Text("My Account",
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28,color: KtextColor)),
      ),

    );
  }
}
