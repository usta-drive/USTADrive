import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:usta/widgets/instructor/instructor_tile.dart';
import 'package:usta/providers/instructors_provider.dart';

class InstructorsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final instructors = Provider.of<Instructors>(context);

    return ListView.builder(
      itemCount: instructors.getInstructorsCount,
      itemBuilder: (context, index) {
        return  GestureDetector(
            child: InstructorTile(instructors.getInstructors[index]),
            onTap: (){
              Navigator.of(context).pushNamed("InstructorProfileScreen",arguments: instructors.getInstructors[index].instructorId);
            });
      },
    );
  }
}
