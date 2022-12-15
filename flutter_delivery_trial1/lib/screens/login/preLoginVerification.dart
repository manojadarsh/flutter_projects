import 'package:flutter/material.dart';
import 'package:flutter_delivery_trial1/models/user.dart';
import 'package:flutter_delivery_trial1/screens/pickupScreen.dart';
import 'package:flutter_delivery_trial1/services/shared_preferences/userPreferences.dart';

import 'loginProvider.dart';


class PreLoginVerification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<User> getUserData() => UserPreferences().getUser();

    return Scaffold(
      body: FutureBuilder(
        future: getUserData(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState){
            case ConnectionState.none:
            case ConnectionState.waiting:
              return CircularProgressIndicator();
            default:
              if(snapshot.hasError) {
                return Text("Error: ${snapshot.error}");
              }
              else if (snapshot.data.jwtToken == null) {
                return LogInProvider();
              }
              return PickupScreen();
          }
        },
      ),
    );
  }
}
