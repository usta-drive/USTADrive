import 'package:flutter/material.dart';
import 'package:usta/widgets/sidebar/sidebar_layout.dart';

void main() =>  runApp(USTAApp());


class USTAApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          body1: TextStyle(color: Colors.black),
        ),
      ),
      initialRoute: 'sidebar_menu',
      routes: {
        'sidebar_menu': (context) => SideBarLayout(),

      },
    );
  }
}
