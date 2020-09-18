import 'package:bloc/bloc.dart';
import 'package:usta/screens/pages/homepage.dart';
import 'package:usta/screens/pages/myaccount.dart';
import 'package:usta/screens/instructors/instructors_screen.dart';
import 'package:usta/screens/instructors/instructor_profile_screen.dart';


enum NavigationEvents {

  HomePageClickEvent,
  MyAccountClickEvent,
  TimelineClickEvent,
  InstructorProfile,
}

abstract class NavigationStates {

}

class NavigationBloc extends Bloc<NavigationEvents,NavigationStates>{
  @override
  // TODO: implement initialState
  NavigationStates get initialState =>InstructorsScreen();

  @override
  Stream<NavigationStates> mapEventToState(event) async* {

    switch(event){
      case NavigationEvents.HomePageClickEvent: yield HomePage();
      break;
      case NavigationEvents.MyAccountClickEvent: yield MyAccount();
      break;
      case NavigationEvents.TimelineClickEvent: yield InstructorsScreen();
      break;
      case NavigationEvents.TimelineClickEvent: yield InstructorProfileScreen();
      break;

    };
  }



}