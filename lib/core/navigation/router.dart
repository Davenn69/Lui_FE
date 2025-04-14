import 'package:go_router/go_router.dart';
import 'package:lui_fe/core/navigation/router_constants.dart';
import 'package:lui_fe/features/auth/presentation/screens/login_screen.dart';
import 'package:lui_fe/features/auth/presentation/screens/splash_screen.dart';
import 'package:lui_fe/features/dashboard/presentation/screens/home_screen.dart';
import 'package:lui_fe/features/statistic/presentation/screens/statistic_screen.dart';
import 'package:lui_fe/features/transaction/presentation/screens/add_expense_screen.dart';
import 'package:lui_fe/features/transaction/presentation/screens/add_income_screen.dart';
import 'package:lui_fe/features/transaction/presentation/screens/transaction_details_screen.dart';
import 'package:lui_fe/features/wallet/presentation/screens/wallet_screen.dart';

import '../../features/auth/presentation/screens/getting_started_screen.dart';
import '../../features/auth/presentation/screens/register_screen.dart';

late GoRouter _router;

GoRouter get router => _router;

setUpRouter({required initialRoute}){
  _router = GoRouter(
    navigatorKey : navigatorKey,
    routes : [
      GoRoute(
        path: '/',
        name : routes.splash,
        builder: (context, state) => const SplashScreen()
      ),
      GoRoute(
        path : '/landing',
        name : routes.landing,
        builder : (context, state) => const GettingStartedScreen()
      ),
      GoRoute(
        path: '/login',
        name: routes.login,
        builder: (context, state) => LoginScreen()
      ),
      GoRoute(
        path: '/register',
        name: routes.register,
        builder: (context, state) => const RegisterScreen()
      ),
      GoRoute(
        path: '/home',
        name: routes.home,
        builder: (context, state) => const HomeScreen()
      ),
      GoRoute(
        path: '/wallet',
        name: routes.wallet,
        builder: (context, state) => const WalletScreen()
      ),
      GoRoute(
        path: '/add_expense',
        name: routes.addExpense,
        builder: (context, state) => const AddExpenseScreen()
      ),
      GoRoute(
        path: '/add_income',
        name: routes.addIncome,
        builder: (context, state) => const AddIncomeScreen()
      ),
      GoRoute(
        path: '/statistic',
        name: routes.statistic,
        builder: (context,state) => const StatisticScreen()
      ),
      GoRoute(
        path: '/transaction_detail',
        name: routes.transactionDetail,
        builder: (context, state) => const TransactionDetailsScreen()
      )
    ]
  );
}