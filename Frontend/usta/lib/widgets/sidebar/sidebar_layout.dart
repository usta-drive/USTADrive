import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:usta/screens/navigation/navigation_bloc.dart';
import 'package:usta/widgets/sidebar/sidebar.dart';

//SideBar tutorial: https://www.youtube.com/watch?v=oExw0U4U_UI

class SideBarLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:   BlocProvider<NavigationBloc>(
        create: (context)=> NavigationBloc(),
        child: Stack(
          children: <Widget>[
            BlocBuilder<NavigationBloc,NavigationStates>(
              builder: (context,navigationState){
                return navigationState as Widget;
              },
            ),
            SideBar(),
          ],
        ) ,
      ),
    );
  }
}
