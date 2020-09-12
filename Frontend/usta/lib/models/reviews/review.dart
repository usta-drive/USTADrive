class Review {
  final int instructorId;
  final int studentId;
  final String studentName;
  final int rating;
  final DateTime ratingDate;
  final String comment;

  Review(
      {this.instructorId,
        this.studentId,
        this.studentName,
        this.rating,
        this.ratingDate,
        this.comment});
}
