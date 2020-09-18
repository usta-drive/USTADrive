import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:usta/providers/instructor_profile_provider.dart';

class InstructorReviews extends StatelessWidget {
  final int instructorId;

  const InstructorReviews({Key key, this.instructorId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final instructorsProviderData =
    Provider.of<InstructorProfileProvider>(context);

    return Container(
      child: ListView.builder(
          itemCount: instructorsProviderData
              .findInstructorProfileById(instructorId)
              .instructorReview
              .instructorReviews
              .length,
          itemBuilder: (_, i) {
            return Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.black,
                  ),
                  SizedBox(width: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(instructorsProviderData
                          .findInstructorProfileById(instructorId)
                          .instructorReview
                          .instructorReviews[i]
                          .studentName
                          .toString()),
                      RatingBar(
                        initialRating: instructorsProviderData
                            .findInstructorProfileById(instructorId)
                            .instructorReview
                            .instructorReviews[i]
                            .rating
                            .toDouble(),
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 20,
                        itemPadding: EdgeInsets.all(1.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Color(0xFFAC1767),
                        ),
                      ),
                      Text(instructorsProviderData
                          .findInstructorProfileById(instructorId)
                          .instructorReview
                          .instructorReviews[i]
                          .comment),
                    ],
                  )
                ],
              ),
            );
          }),
    );
  }
}