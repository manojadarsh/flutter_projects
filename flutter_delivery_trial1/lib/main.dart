import 'package:flutter/material.dart';
import 'package:flutter_delivery_trial1/providers/authProvider.dart';
import 'package:flutter_delivery_trial1/providers/userProvider.dart';
import 'package:flutter_delivery_trial1/screens/splashScreen.dart';
import 'package:provider/provider.dart';

import 'app_properties.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [

        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),

      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: green,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SplashScreen(),
        //CategoryScreen(),
        //HomePage2(),
      ),
    );
  }
}
