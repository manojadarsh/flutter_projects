import 'dart:async';

import 'package:flutter/material.dart';

import 'login/preLoginVerification.dart';
import 'package:flutter_delivery_trial1/app_properties.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: initScreen(context),
    );
  }

  startTime() async {
    var duration = new Duration(milliseconds: 1500);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) =>
            PreLoginVerification()
      //SignIn()
    )
    );
  }
  initScreen(BuildContext context) {
    return Scaffold(
      body:
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width-50,
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: const AssetImage('assets/images/freshlii_logo.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Positioned(
                    bottom: 80,
                    left: 22,
                    child: Text("For Drivers", style: TextStyle(color: red, fontSize: 25),))
              ],
            ),
            //Text("For Stores", style: TextStyle(color: red, fontSize: 17),)
          ],
        ),
      ),
      /*CircularProgressIndicator(
                backgroundColor: green,
                strokeWidth: 1,
              )*/

    );
  }
}

