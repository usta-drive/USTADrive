import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:usta/providers/instructor_profile_provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart'
as customicons;
import 'package:usta/screens/navigation/navigation_bloc.dart';

import '../../widgets/instructor/instructor_vehicles.dart';
import '../../widgets/instructor/instrcutor_reviews_widget.dart';
import '../../widgets/instructor/tab_widget.dart';



class InstructorProfileScreen extends StatefulWidget with NavigationStates {
  //final int instructorId;

  //const InstructorProfileScreen({Key key, this.instructorId}) : super(key: key);

  @override
  _InstructorProfileScreenState createState() =>
      _InstructorProfileScreenState();
}

class _InstructorProfileScreenState extends State<InstructorProfileScreen>
    with TickerProviderStateMixin {
  TabController _tabController;
  //final int _instid ;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

//Color(0xFFDDB644)
  @override
  Widget build(BuildContext context) {

    final int _instid =
    ModalRoute.of(context).settings.arguments as int;

    final instructorsProviderData =
    Provider.of<InstructorProfileProvider>(context);

    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(7),
            width: double.infinity,
            color: Color(0xFFDDB644),
            child: Column(
              children: <Widget>[
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      alignment: Alignment.topLeft,
                      onPressed: (){
                        Navigator.of(context).pushNamed("sidebar_menu");
                      },
                      splashColor: Colors.black,
                    ),
                    Text("PROFILE"),
                    Icon(customicons.MdiIcons.heart),
                  ],
                ),
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage(instructorsProviderData
                      .findInstructorProfileById(_instid)
                      .instructorInformation
                      .imageUrl),
                ),
                Text(
                  instructorsProviderData
                      .findInstructorProfileById(_instid)
                      .instructorInformation
                      .instructorName,
                  style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                RatingBar(
                  initialRating: instructorsProviderData
                      .findInstructorProfileById(_instid)
                      .instructorInformation
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
              ],
            ),
          ),
          Container(
            child: TabBar(
                controller: _tabController,
                indicatorColor: Colors.teal,
                labelColor: Colors.teal,
                unselectedLabelColor: Colors.black54,
                tabs: <Widget>[
                  TabWidget(
                    tabName: "Vehicles",
                    tabIcon: customicons.MdiIcons.car2Plus,
                    summery: instructorsProviderData
                        .findInstructorProfileById(_instid)
                        .instructorVehicles
                        .instructorVehicles
                        .length
                        .toString(),
                  ),
                  TabWidget(
                      tabName: "Prices",
                      tabIcon: customicons.MdiIcons.cash100,
                      summery: instructorsProviderData
                          .findInstructorProfileById(_instid)
                          .instructorInformation
                          .hourPrice
                          .toString()),
                  TabWidget(
                    tabName: "Reviews",
                    tabIcon: customicons.MdiIcons.chatProcessing,
                    summery: instructorsProviderData
                        .findInstructorProfileById(_instid)
                        .instructorReview
                        .instructorReviews
                        .length
                        .toString(),
                  ),
                  TabWidget(
                    tabName: "Languages",
                    tabIcon: customicons.MdiIcons.map,
                    summery: "5",
                  ),
//                Tab(
//                  icon: Icon(Icons.home),
//                ),
//                Tab(
//                  icon: Icon(Icons.email),
//                ),
//                Tab(
//                  icon: Icon(Icons.settings),
//                ),
                ]),
          ),
          Container(
            height: 600.0,
            child: TabBarView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InstructorVehicles(instructorId: _instid),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Prices"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InstructorReviews(instructorId: _instid),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Languages"),
                ),
              ],
              controller: _tabController,
            ),
          ),
        ],
      ),
    );
  }
}
