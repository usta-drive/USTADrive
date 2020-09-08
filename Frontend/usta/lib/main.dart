import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:usta/widgets/sidebar/sidebar_layout.dart';
import 'package:usta/screens/timeline/instructors_screen.dart';
import 'package:usta/providers/instructor.dart';
import 'package:usta/providers/instructors_provider.dart';
import 'package:usta/screens/regitstration/registration_screen.dart';

void main() =>  runApp(USTAApp());


class USTAApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Instructors(),
        ),
        ChangeNotifierProvider(
          create: (context) => Instructor(),
        ),
      ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light().copyWith(
            textTheme: TextTheme(
              body1: TextStyle(color: Colors.black),
            ),
          ),
          initialRoute: 'registration_screen',
          routes: {
            'sidebar_menu': (context) => SideBarLayout(),
            'timeline': (context) => InstructorsScreen(),
            'registration_screen': (context) => UstaRegistration_screen(),

          },
        ),

    );
  }
}
