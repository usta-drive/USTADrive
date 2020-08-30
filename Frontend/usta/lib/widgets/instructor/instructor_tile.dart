import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:usta/providers/instructor.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class InstructorTile extends StatelessWidget {
  final Instructor _instructor;

  InstructorTile(this._instructor);

  @override
  Widget build(BuildContext context) {
    //final instructor = Provider.of<Instructor>(context ,listen: false);

    return Container(
      // color:  Color(0xFFDDB64F),
      margin: const EdgeInsets.all(5.0),
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        border: Border.all(),
        color:  Color(0xFFDDB644),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Image.asset(
                _instructor.imageUrl,
                width: 80,
                fit: BoxFit.fill,
              ),
              Container(
                child: RatingBar(

                  initialRating: _instructor.rating.toDouble(),
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 20,
                  itemPadding:EdgeInsets.all(
                      1.0
                  ),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Color(0xFFAC1767),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(
            width: 20,
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                _instructor.instructorName.toString(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 5,
                height: 5,
              ),
              Text(_instructor.hourPrice.toString()),
            ],
          ),
        ],
      ),
    );
  }
}
