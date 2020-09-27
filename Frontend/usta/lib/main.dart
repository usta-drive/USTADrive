import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:usta/widgets/sidebar/sidebar_layout.dart';
import 'package:usta/screens/instructors/instructors_screen.dart';
import 'package:usta/models/instructor/instructor.dart';
import 'package:usta/providers/instructors_provider.dart';
import 'package:usta/screens/login/login_screen.dart';
import 'package:usta/screens/regitstration/registration_screen.dart';
import 'screens/instructors/instructor_profile_screen.dart';
import 'providers/instructor_profile_provider.dart';
import 'package:usta/providers/login_provider.dart';

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
          create: (context) => InstructorProfileProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Authentication(),
        ),
      ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light().copyWith(
            textTheme: TextTheme(
              body1: TextStyle(color: Colors.black),
            ),
          ),

          initialRoute: 'login_screen',

          routes: {
            'login_screen': (context) => LoginScreen(),
            'sidebar_menu': (context) => SideBarLayout(),
            'timeline': (context) => InstructorsScreen(),
            'registration_screen': (context) => UstaRegistration_screen(),
            'instructors_screen': (context) => InstructorsScreen(),
            "InstructorProfileScreen": (context) => InstructorProfileScreen(),

          },
        ),

    );
  }
}
