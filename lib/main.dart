import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:lui_fe/features/auth/presentation/screens/register_screen.dart';
import 'package:lui_fe/features/auth/presentation/screens/splash_screen.dart';
import 'package:lui_fe/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:lui_fe/features/statistic/presentation/screens/statistic_screen.dart';

import 'features/auth/presentation/screens/login_screen.dart';
import 'features/auth/presentation/screens/getting_started_screen.dart';
import 'features/dashboard/presentation/screens/home_screen.dart';
import 'features/wallet/presentation/screens/wallet_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appDir = await getApplicationDocumentsDirectory();

  await Hive.initFlutter(appDir.path);
  final collection = await BoxCollection.open("localStorage", {'sessionBox'}, path: appDir.path);

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((_){
    runApp(ProviderScope(
      child: MaterialApp(
        theme: ThemeData(
          textTheme: GoogleFonts.interTextTheme(),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              padding: WidgetStateProperty.all(
                EdgeInsets.symmetric(vertical: 14, horizontal: 24),
              ),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              foregroundColor: WidgetStateProperty.all(Colors.white),
              textStyle: WidgetStateProperty.all(
                GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              overlayColor: WidgetStateProperty.all(Colors.white24),
              backgroundColor: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.pressed)) {
                  return Colors.teal[700];
                }
                return Colors.transparent;
              }),
              elevation: WidgetStateProperty.all(0),
            ),
          ),
        ),
        initialRoute: "/",
        routes: {
          "/" : (context) => SplashScreen(),
          "/getting_started" : (context) => GettingStartedScreen(),
          "/register" : (context) => RegisterScreen(),
          '/login' : (context) => LoginScreen(),
          '/home' : (context) => HomeScreen(),
          '/statistic' : (context) => StatisticScreen(),
          '/wallet' : (context) => WalletScreen()
        },
      ),
    ));
  });
}

