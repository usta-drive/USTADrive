import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:usta/providers/instructor_profile_provider.dart';



class InstructorVehicles extends StatelessWidget {
  final int instructorId;

  const InstructorVehicles({Key key, this.instructorId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final instructorsProviderData =
    Provider.of<InstructorProfileProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          child: ListView.builder(
              itemCount: instructorsProviderData
                  .findInstructorProfileById(instructorId)
                  .instructorVehicles
                  .instructorVehicles
                  .length,
              itemBuilder: (_, i) => Card(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        CircleAvatar(
                            radius: 30.0,
                            backgroundColor: Colors.black),//
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              instructorsProviderData
                                  .findInstructorProfileById(instructorId)
                                  .instructorVehicles
                                  .instructorVehicles[i]
                                  .vehicleName,
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(instructorsProviderData
                                .findInstructorProfileById(instructorId)
                                .instructorVehicles
                                .instructorVehicles[i]
                                .vehicleYear),
                            Text(instructorsProviderData
                                .findInstructorProfileById(instructorId)
                                .instructorVehicles
                                .instructorVehicles[i]
                                .vehiclePricePerHour
                                .toString()),
                            Divider(),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ))),
    );
  }
}
