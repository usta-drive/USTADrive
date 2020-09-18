import 'package:flutter/material.dart';


class InstructorProfileTabBar extends StatefulWidget {
  InstructorProfileTabBar ({Key key}) : super(key: key);
  //final String title;


  @override
  _InstructorProfileTabBarState createState() => _InstructorProfileTabBarState();
}

class _InstructorProfileTabBarState extends State<InstructorProfileTabBar> with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 3, vsync: this);
    super.initState();

  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              child: TabBar(
                  controller: _tabController,
                  indicatorColor: Colors.teal,
                  labelColor: Colors.teal,
                  unselectedLabelColor: Colors.black54,
                  tabs: <Widget>[
                    Tab(
                      icon: Icon(Icons.home),
                    ),
                    Tab(
                      icon: Icon(Icons.email),
                    ),
                    Tab(
                      icon: Icon(Icons.settings),
                    ),
                  ]),
            ),
            Container(
              height: 50.0,
              child: TabBarView(
                children: <Widget>[
                  Center(
                    child: Text("Home"),
                  ),
                  Center(
                    child: Text("Email"),
                  ),
                  Center(
                    child: Text("Settings"),
                  )
                ],
                controller: _tabController,
              ),),
          ],
        ),
      ),
    ) ;
  }
}
