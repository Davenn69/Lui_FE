import 'package:flutter/cupertino.dart';

class _RouterPaths {
  final String login = 'login';
  final String register = 'register';
  final String splash = 'splash';
  final String landing = 'landing';
  final String home = 'home';
  final String addExpense = 'add_expense';
  final String addIncome = 'add_income';
  final String statistic = 'statistic';
  final String wallet = 'wallet';
  final String transactionDetail = 'transaction_detail';
}

final routes = _RouterPaths();

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

BuildContext get ctx => navigatorKey.currentContext!;