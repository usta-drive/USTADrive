import 'package:flutter/material.dart';
import 'package:usta/screens/navigation/navigation_bloc.dart';

import 'package:usta/widgets/instructor//instructor_list.dart';

class InstructorsScreen extends StatefulWidget with NavigationStates {
  @override
  _InstructorsScreenState createState() => _InstructorsScreenState();
}

class _InstructorsScreenState extends State<InstructorsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: TextField(
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Enter a search term'
          ),
        ),
      ),
      body: InstructorsList(),

    );
  }
}
