import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:lui_fe/core/session/presentation/providers/providers.dart';
import 'package:lui_fe/core/utils/navigation_service.dart';
import 'package:path_provider/path_provider.dart';

class SplashScreen extends ConsumerStatefulWidget{
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends ConsumerState<SplashScreen>{


  navigateToLogin(){
    Timer(Duration(seconds: 2), (){
      if(mounted){
        if(ModalRoute.of(context)?.isCurrent == true){
          Navigator.of(context).pushReplacement(NavigationService.navigationFromSplashToGettingStarted());
        }
      }
    });
  }

  navigateToHome(){
    Timer(Duration(seconds: 2), (){
      if(mounted){
        if(ModalRoute.of(context)?.isCurrent == true){
          Navigator.of(context).pushReplacement(NavigationService.navigationFromLoginToHome());
        }
      }
    });
  }

  Future<void> sessionInitialization()async{
    final appDir = await getApplicationDocumentsDirectory();
    final collection = await BoxCollection.open("localStorage", {'sessionBox'}, path: appDir.path);

    final sessionBox = await collection.openBox<Map>('sessionBox');

    ref.read(hiveBoxProvider.notifier).state = sessionBox;

    final data = await ref.read(getSessionUsecaseProvider).call();
    print("session Key $data");
    
    ref.read(sessionData.notifier).state = data;

    if(data!=null && data.isNotEmpty){
      navigateToHome();
      return;
    }

    navigateToLogin();
  }

  @override
  void initState(){
    super.initState();
    sessionInitialization();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              colors.primary,
              colors.secondary
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