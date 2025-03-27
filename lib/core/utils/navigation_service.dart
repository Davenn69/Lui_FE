import 'package:flutter/cupertino.dart';
import 'package:lui_fe/features/auth/presentation/screens/register_screen.dart';
import 'package:lui_fe/features/transaction/presentation/screens/transaction_details_screen.dart';

import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/getting_started_screen.dart';
import '../../features/transaction/presentation/screens/add_expense_screen.dart';
import '../../features/transaction/presentation/screens/add_income_screen.dart';

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

  static Route navigationFromGettingToRegister(){
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondAnimation) => RegisterScreen(),
      transitionDuration: Duration(milliseconds: 300),
      reverseTransitionDuration: Duration(milliseconds: 300),
      transitionsBuilder: (context, animation, secondAnimation, child){
          var tween = Tween(begin: Offset(1.0, 0), end: Offset.zero).chain(CurveTween(curve: Curves.easeInOut));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(position: offsetAnimation, child: child);
      }
    );
  }

  static Route navigationFromGettingToLogin(){
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondAnimation) => LoginScreen(),
        transitionDuration: Duration(milliseconds: 300),
        reverseTransitionDuration: Duration(milliseconds: 300),
        transitionsBuilder: (context, animation, secondAnimation, child){
          var tween = Tween(begin: Offset(1.0, 0), end: Offset.zero).chain(CurveTween(curve: Curves.easeInOut));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(position: offsetAnimation, child: child);
        }
    );
  }

  static Route navigationFromDashboardToAddExpense(){
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondAnimation) => AddExpenseScreen(),
        transitionDuration: Duration(milliseconds: 300),
        reverseTransitionDuration: Duration(milliseconds: 300),
        transitionsBuilder: (context, animation, secondAnimation, child){
          var tween = Tween(begin: Offset(1.0, 0), end: Offset.zero).chain(CurveTween(curve: Curves.easeInOut));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(position: offsetAnimation, child: child);
        }
    );
  }

  static Route navigationFromDashboardToAddIncome(){
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondAnimation) => AddIncomeScreen(),
        transitionDuration: Duration(milliseconds: 300),
        reverseTransitionDuration: Duration(milliseconds: 300),
        transitionsBuilder: (context, animation, secondAnimation, child){
          var tween = Tween(begin: Offset(1.0, 0), end: Offset.zero).chain(CurveTween(curve: Curves.easeInOut));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(position: offsetAnimation, child: child);
        }
    );
  }

  static Route navigationFromDashboardToDetails(){
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondAnimation) => TransactionDetailsScreen(),
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