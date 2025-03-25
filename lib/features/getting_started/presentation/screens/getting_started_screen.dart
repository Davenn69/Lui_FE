import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lui_fe/core/utils/navigation_service.dart';

class GettingStartedScreen extends StatelessWidget{
  const GettingStartedScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.asset(
                  "assets/images/getting_started_background.png",
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 110),
                  child: Image.asset(
                    "assets/images/person.png"
                  ),
                )
              ],
            ),
            SizedBox(height: 5),
            Text(
                "Spend Smarter",
              style: TextStyle(
                color: Color(0xFF438883),
                fontSize: 32,
                fontWeight: FontWeight.bold
              ),
            ),
            Text(
              "Save More",
              style: TextStyle(
                  color: Color(0xFF438883),
                  fontSize: 32,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: 250,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Color(0xFF429690),
                      Color(0xFF2A7C76)
                    ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).push(NavigationService.navigationFromGettingToRegister());
                  },
                  child: Text(
                    "Get Started"
                  )),
            ),
            SizedBox(height:10 ),
            RichText(
                text: TextSpan(
                  style: GoogleFonts.inter(fontSize: 12, color: Colors.black54),
                  children: [
                    TextSpan(
                      text: "Already have an account? "
                    ),
                    TextSpan(
                      text: "Log In",
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: Color(0xFF2A7C76),
                        fontWeight: FontWeight.bold
                      ),
                      recognizer: TapGestureRecognizer()..onTap = (){
                        Navigator.of(context).push(NavigationService.navigationFromGettingToLogin());
                      }
                    )
                  ]
                )
            )
          ],
        ),
      ),
    );
  }
}