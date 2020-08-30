import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:usta/widgets/sidebar/sidebar_layout.dart';
import 'package:usta/screens/timeline/instructors_screen.dart';
import 'package:usta/providers/instructor.dart';
import 'package:usta/providers/instructors_provider.dart';

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
          theme: ThemeData.dark().copyWith(
            textTheme: TextTheme(
              body1: TextStyle(color: Colors.black),
            ),
          ),
          initialRoute: 'sidebar_menu',
          routes: {
            'sidebar_menu': (context) => SideBarLayout(),
            'timeline': (context) => InstructorsScreen(),

          },
        ),

    );
  }
}
