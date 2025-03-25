import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lui_fe/features/splash/presentation/screens/splash_screen.dart';

import 'features/getting_started/presentation/screens/getting_started_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((_){
    runApp(MaterialApp(
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
      },
    ));
  });
}

