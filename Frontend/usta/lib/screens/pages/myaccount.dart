import 'package:flutter/material.dart';
import 'package:usta/common/constants/colors.dart';
import 'package:usta/screens/navigation/navigation_bloc.dart';

class MyAccount extends StatelessWidget  with NavigationStates {
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
