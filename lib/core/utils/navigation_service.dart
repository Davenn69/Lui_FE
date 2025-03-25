import 'package:flutter/cupertino.dart';

import '../../features/getting_started/presentation/screens/getting_started_screen.dart';

class NavigationService{
  static Route navigationFromSplashToGettingStarted(){
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondAnimation) => GettingStartedScreen(),
      transitionDuration: Duration(milliseconds: 300),
      reverseTransitionDuration: Duration(milliseconds: 300),
      transitionsBuilder: (context, animation, secondAnimation, child){
        var tween = Tween(begin: Offset(1.0, 0), end: Offset.zero).chain(CurveTween(curve: Curves.easeInOut));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(position: offsetAnimation, child: child);
      }
    );
  }
}