import 'package:flutter/material.dart';
import 'package:usta/screens/navigation/navigation_bloc.dart';
import 'package:usta/common/constants/colors.dart';

class HomePage extends StatefulWidget with NavigationStates{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Text("HomePage",
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28,color: KtextColor)),
      ),

    );
  }
}
