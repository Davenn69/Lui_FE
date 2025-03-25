import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lui_fe/core/utils/navigation_service.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>{

  navigateAfterTimer(){
    Timer(Duration(seconds: 2), (){
      if(mounted){
        if(ModalRoute.of(context)?.isCurrent == true){
          Navigator.of(context).pushReplacement(NavigationService.navigationFromSplashToGettingStarted());
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    navigateAfterTimer();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF429690),
              Color(0xFF2A7C76)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
          )
        ),
        child: Stack(
          children: [
            Center(
              child: Text(
                  "mono",
                  style : GoogleFonts.inter(
                      fontSize: 52,
                      color: Colors.white,
                    fontWeight: FontWeight.bold
                  )
              ),
            ),
            Image.asset(
              "assets/images/splash_background.png",
              fit: BoxFit.fill,
            )
          ],
        ),
      ),
    );
  }
}