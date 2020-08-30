import 'package:flutter/foundation.dart';

class Instructor with ChangeNotifier {
  final int instructorId;
  final String instructorName;
  final double hourPrice;
  final String imageUrl;
  final int rating;

  Instructor({
    @required this.instructorId,
    @required this.instructorName,
    @required this.hourPrice,
    @required this.imageUrl,
    @required this.rating,
  });
}
