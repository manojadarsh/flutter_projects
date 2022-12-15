import 'package:flutter/material.dart';
import 'package:freshlii_store_trial_2/providers/authProvider.dart';
import 'package:freshlii_store_trial_2/providers/onlineProvider.dart';
import 'package:freshlii_store_trial_2/providers/ordersFullProvider.dart';
import 'package:freshlii_store_trial_2/providers/ordersProvider.dart';
import 'package:freshlii_store_trial_2/providers/summaryProvider.dart';
import 'package:freshlii_store_trial_2/providers/userProvider.dart';
import 'package:freshlii_store_trial_2/screens/splashScreen.dart';
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
        ChangeNotifierProvider(create: (context) => OnlineProvider()),
        ChangeNotifierProvider(create: (context) => OrdersProvider()),
        ChangeNotifierProvider(create: (context) => SummaryProvider()),
        ChangeNotifierProvider(create: (context) => OrdersFullProvider()),
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