import 'package:flutter/foundation.dart';
import './instructor.dart';

class Instructors with ChangeNotifier {
  List<Instructor> _instructors = [
    Instructor(
      instructorId: 1,
      instructorName: "Shahd Osman",
      hourPrice: 10.0,
      imageUrl: "assets/images/blackfemale.png",
      rating: 3,
    ),
    Instructor(
      instructorId: 2,
      instructorName: "Mohamed Abdelgader",
      hourPrice: 10.0,
      imageUrl: "assets/images/blackmale.png",
      rating: 4,
    ),
    Instructor(
      instructorId: 3,
      instructorName: "Mohamed Akoud",
      hourPrice: 10.0,
      imageUrl: "assets/images/whitemale.png",
      rating: 2,
    ),
    Instructor(
      instructorId: 4,
      instructorName: "Tagwa Abdelrahman",
      hourPrice: 10.0,
      imageUrl: "assets/images/whitefemale.png",
      rating: 1,
    ),
    Instructor(
      instructorId: 5,
      instructorName: "Elbagir Abdulmagid",
      hourPrice: 10.0,
      imageUrl: "assets/images/blackmale.png",
      rating: 4,
    ),
    Instructor(
      instructorId: 6,
      instructorName: "Manal Ali",
      hourPrice: 10.0,
      imageUrl: "assets/images/blackfemale.png",
      rating: 3,
    ),
    Instructor(
      instructorId: 7,
      instructorName: "Hazem Elmalik",
      hourPrice: 10.0,
      imageUrl: "assets/images/whitemale.png",
      rating: 1,
    ),
    Instructor(
      instructorId: 8,
      instructorName: "Ghada Abdelwhab",
      hourPrice: 10.0,
      imageUrl: "assets/images/whitefemale.png",
      rating: 4,
    ),
    Instructor(
      instructorId: 9,
      instructorName: "Mohamed Ibrahim",
      hourPrice: 10.0,
      imageUrl: "assets/images/blackmale.png",
      rating: 2,
    ),
    Instructor(
      instructorId: 10,
      instructorName: "AbuHuraira Z Abdelhalim ",
      hourPrice: 10.0,
      imageUrl: "assets/images/whitemale.png",
      rating: 2,
    ),
    Instructor(
      instructorId: 11,
      instructorName: "Ahmed Almubarak",
      hourPrice: 10.0,
      imageUrl:  "assets/images/blackmale.png",
      rating: 3,
    ),
    Instructor(
      instructorId: 12,
      instructorName: "Nazik Elhag",
      hourPrice: 10.0,
      imageUrl: "assets/images/whitemale.png",
      rating: 1,
    ),
  ];


  List<Instructor> get getInstructors{
    return _instructors;
  }

  int get getInstructorsCount{
    return _instructors.length;

  }

  Instructor findById(int id) {
    return _instructors.firstWhere((instr) => instr.instructorId == id);
  }
}
