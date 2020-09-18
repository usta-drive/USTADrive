import 'instructor_vehicles.dart';
import 'instructor.dart';
import 'instructor_reviews.dart';


class InstructorProfile {
  final int instructorId;
  final Instructor instructorInformation;
  final InstructorVehicles instructorVehicles;
  final InstructorReviews instructorReview;

  InstructorProfile(
      {this.instructorId,
        this.instructorInformation,
        this.instructorVehicles,
        this.instructorReview
      });
}
