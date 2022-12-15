import 'package:flutter/material.dart';
import 'package:freshlii_store_trial_2/components/appBar.dart';
import 'package:freshlii_store_trial_2/components/drawer.dart';
import 'package:freshlii_store_trial_2/providers/onlineProvider.dart';
import 'package:provider/provider.dart';

import '../../app_properties.dart';

class OnlinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var onlineProvider = Provider.of<OnlineProvider>(context);
    bool isOnline = onlineProvider.isOnline;

    return Scaffold(
      appBar: CustomAppBar(
        displayText: "Go Online",
      ),
      drawer: myDrawer(),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
                onTap: () {
                  onlineProvider.switchAvailability(context);
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width - 25,
                      height: MediaQuery.of(context).size.width - 25,
                      decoration: BoxDecoration(
                          color: isOnline ? green : red,
                          borderRadius: BorderRadius.circular(500)),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 50,
                      height: MediaQuery.of(context).size.width - 50,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                            color: white,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(500)),
                    ),
                    Text(
                      isOnline ? "Online" : "Offline",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: white, fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),

            Text(
              isOnline ? "Please note when a store is online, all orders must be prepared." : "Please note if a store goes offline, customers are not able to place orders.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: isOnline ? green : red, fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),

    );
  }
}
