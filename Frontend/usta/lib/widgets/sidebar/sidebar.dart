import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:usta/screens/navigation/navigation_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'menu_item.dart';

//SideBar tutorial: https://www.youtube.com/watch?v=oExw0U4U_UI

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> with TickerProviderStateMixin {
  AnimationController _animationController;
  StreamController<bool> isSideBarOpenedStreamColltroller;
  Stream<bool> isSideBArOpenedStream;
  StreamSink<bool> isSideBarOpenedSink;

  final _animationDuration = const Duration(milliseconds: 300);

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: _animationDuration, vsync: this);
    isSideBarOpenedStreamColltroller = PublishSubject<bool>();
    isSideBArOpenedStream = isSideBarOpenedStreamColltroller.stream;
    isSideBarOpenedSink = isSideBarOpenedStreamColltroller.sink;
  }

  @override
  void dispose() {
    _animationController.dispose();
    isSideBarOpenedStreamColltroller.close();
    isSideBarOpenedSink.close();
    super.dispose();
  }

  void onIconPressed() {
    final animationstatus = _animationController.status;
    final isAnimationCompleted = animationstatus == AnimationStatus.completed;

    if (isAnimationCompleted) {
      isSideBarOpenedSink.add(false);
      _animationController.reverse();
    } else {
      isSideBarOpenedSink.add(true);
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return StreamBuilder<bool>(
      initialData: false,
      stream: isSideBArOpenedStream,
      builder: (context, isSideBarOpenedAsync) {
        return AnimatedPositioned(
          duration: _animationDuration,
          top: 0,
          bottom: 0,
          left: isSideBarOpenedAsync.data ? 0 : -screenWidth,
          right: isSideBarOpenedAsync.data ? 0 : screenWidth - 30,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  color: Color(0xFFB7864D),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 100,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Text('AH'),
                      ),
                      Divider(
                        height: 64,
                        thickness: 0.5,
                        color: Colors.white,
                        indent: 32,
                        endIndent: 32,
                      ),
                      MenuItem(
                        icon: Icons.home,
                        title: "TimeLine",
                        onTap: () {
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context)
                              .add(NavigationEvents.HomePageClickEvent);
                        },
                      ),
                      MenuItem(
                        icon: Icons.person,
                        title: "My Account",
                        onTap: () {
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context)
                              .add(NavigationEvents.MyAccountClickEvent);
                        },
                      ),
                      MenuItem(
                        icon: Icons.message,
                        title: "Messages",
                        onTap: () {},
                      ),
                      MenuItem(
                        icon: Icons.calendar_today,
                        title: "Bookings",
                        onTap: () {
                          return null;
                        },
                      ),
                      MenuItem(
                        icon: Icons.schedule,
                        title: "Schedules",
                        onTap: (){return null;},
                      ),
                      MenuItem(
                        icon: Icons.payment,
                        title: "Payments",
                        onTap: (){return null;},

                      ),
                      MenuItem(
                        icon: Icons.folder_open,
                        title: "Documents",
                        onTap: (){return null;},
                      ),
                      MenuItem(
                        icon: Icons.history,
                        title: "History",
                        onTap: (){return null;},
                      ),
                      MenuItem(
                        icon: Icons.settings,
                        title: "Settings",
                        
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, -0.9),
                child: GestureDetector(
                  onTap: () {
                    onIconPressed();
                  },
                  child: ClipPath(
                    clipper: CustomerMenuClipper(),
                    child: Container(
                      width: 35,
                      color: Color(0xFFDDB64F),
                      height: 110,
                      alignment: Alignment.centerLeft,
                      child: AnimatedIcon(
                        icon: AnimatedIcons.menu_close,
                        progress: _animationController.view,
                        color: Color(0xFFB7864D),
                        size: 25,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class CustomerMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = Colors.white;

    final width = size.width;
    final height = size.height;

    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width - 1, height / 2 - 20, width, height / 2);
    path.quadraticBezierTo(width + 1, height / 2 + 20, 10, height - 16);
    path.quadraticBezierTo(0, height - 8, 0, height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
