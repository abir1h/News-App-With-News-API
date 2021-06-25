import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Main Screen.dart';
class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State< SplashScreen> {

  @override
  Widget build(BuildContext context) {
    return initScreen(context);
  }


  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = Duration(seconds: 5);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => Main()
    )
    );
  }

  initScreen(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 300),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SpinKitDoubleBounce(
              color: Colors.blue,
              size: 100.0,

            ),SizedBox(height: 15,),
            Center(
              child: Text("News Briefing",style: GoogleFonts.lato(fontStyle: FontStyle.italic,fontWeight: FontWeight.w900,color: Colors.blue,fontSize: 35),),
            )
          ],
        ),
      ),
    );
  }
}
