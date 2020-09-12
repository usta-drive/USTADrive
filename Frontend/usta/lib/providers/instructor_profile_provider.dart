import 'package:flutter/foundation.dart';
import '../models/instructor/instructor_profile.dart';
import '../models/instructor/vehicle.dart';
import '../models/reviews/review.dart';
import '../models/instructor/instructor.dart';
import 'instructors_provider.dart';
import '../models/instructor/instructor_vehicles.dart';
import '../models/instructor/instructor_reviews.dart';



class InstructorProfileProvider with ChangeNotifier {
  List<InstructorProfile> _instrcutorProfile;


  //Helper fucntion to generate Instrcutors profile , it will be removed after the API is ready
  List<InstructorProfile> get _generateMockInstructorProfileData {
    Instructors instrcutorprovider = Instructors();
    List<Instructor> instuctorsList = List<Instructor>();
    List<InstructorProfile> result =List<InstructorProfile>();

    instuctorsList = instrcutorprovider.getInstructors;


    for (var i = 0; i < instuctorsList.length; i++) {
      InstructorProfile temp = InstructorProfile(
          instructorId: instuctorsList[i].instructorId,
          instructorInformation: instuctorsList[i],
          instructorVehicles: InstructorVehicles(
              instructorId: instuctorsList[i].instructorId,
              instructorVehicles: _getmockVechileList),
          instructorReview: InstructorReviews(
              instructorId: instuctorsList[i].instructorId,
              instructorReviews:
              _getMockReviewList(instuctorsList[i].instructorId)));
      result.add(temp);
    }

    return result;
  }



  List<InstructorProfile> get getInstructorsProfileProvider{
    return _generateMockInstructorProfileData;
  }

  InstructorProfile findInstructorProfileById(int InstructorId) {
    return getInstructorsProfileProvider.firstWhere((inst) => inst.instructorId == InstructorId);
  }

  //temp Fuction to popluate Instructor Vehicles till the web service built
  List<Vehicle> get _getmockVechileList {
    Vehicle _accord = Vehicle(
      vehicleId: 1,
      vehicleName: "Accord",
      vehicleModel: "Accord",
      vehicleYear: "2010",
      vehicleBodyStyle: "Sedan",
      vehicleMake: "Honda",
      vehiclePlateNumber: "ABC-1234",
      vehicleDescription: "Vechile Description",
      vehicleFrontImage: "vehicleFrontImage",
      vehicleBackImage: "vehicleBackImage",
      vehicleRightSideImage: "vehicleRightSideImage",
      vehicleLeftSideImage: "vehicleLeftSideImage",
      vehiclePricePerHour: 50.0,
    );

    Vehicle _Camry = Vehicle(
      vehicleId: 2,
      vehicleName: "Camry",
      vehicleModel: "Camry",
      vehicleYear: "2010",
      vehicleBodyStyle: "Sedan",
      vehicleMake: "Toyota",
      vehiclePlateNumber: "ABC-5678",
      vehicleDescription: "Vechile Description",
      vehicleFrontImage: "vehicleFrontImage",
      vehicleBackImage: "vehicleBackImage",
      vehicleRightSideImage: "vehicleRightSideImage",
      vehicleLeftSideImage: "vehicleLeftSideImage",
      vehiclePricePerHour: 40.0,
    );

    Vehicle _Subaru = Vehicle(
      vehicleId: 3,
      vehicleName: "Impreza",
      vehicleModel: "Impreza",
      vehicleYear: "2020",
      vehicleBodyStyle: "Sedan",
      vehicleMake: "Subaru",
      vehiclePlateNumber: "ABC-8901",
      vehicleDescription: "Vechile Description",
      vehicleFrontImage: "vehicleFrontImage",
      vehicleBackImage: "vehicleBackImage",
      vehicleRightSideImage: "vehicleRightSideImage",
      vehicleLeftSideImage: "vehicleLeftSideImage",
      vehiclePricePerHour: 60.0,
    );
    List<Vehicle> lst = List<Vehicle>();
    lst.add(_accord);
    lst.add(_Camry);
    lst.add(_Subaru);
    return lst;
  }

  //temp Fuction to generate mock review till the API is ready
  List<Review> _getMockReviewList(int instructorId) {
    List<Review> l = List<Review>();
    Review r1 = Review(
      instructorId: instructorId,
      rating: 3,
      comment: "Comment no 1",
      ratingDate: DateTime.now(),
      studentId: 1,
      studentName: "Student Name 1",
    );
    Review r2 = Review(
      instructorId: instructorId,
      rating: 4,
      comment: "Comment no '2'",
      ratingDate: DateTime.now(),
      studentId: 2,
      studentName: "Student Name 2'",
    );
    Review r3 = Review(
      instructorId: instructorId,
      rating: 2,
      comment: "Comment no '3'",
      ratingDate: DateTime.now(),
      studentId: 3,
      studentName: "Student Name 3'",
    );

    l.add(r1);
    l.add(r2);
    l.add(r3);

    return l;
  }


}
