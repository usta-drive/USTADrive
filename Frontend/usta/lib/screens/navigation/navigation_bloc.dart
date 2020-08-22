import 'package:bloc/bloc.dart';
import 'package:usta/screens/pages/homepage.dart';
import 'package:usta/screens/pages/myaccount.dart';


enum NavigationEvents {

  HomePageClickEvent,
  MyAccountClickEvent,
}

abstract class NavigationStates {

}

class NavigationBloc extends Bloc<NavigationEvents,NavigationStates>{
  @override
  // TODO: implement initialState
  NavigationStates get initialState =>HomePage();

  @override
  Stream<NavigationStates> mapEventToState(event) async* {

    switch(event){
      case NavigationEvents.HomePageClickEvent: yield HomePage();
      break;
      case NavigationEvents.MyAccountClickEvent: yield MyAccount();
      break;

    };
  }



}