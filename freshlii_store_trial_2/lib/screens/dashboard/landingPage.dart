import 'package:flutter/material.dart';
import 'package:freshlii_store_trial_2/components/appBar.dart';
import 'package:freshlii_store_trial_2/components/drawer.dart';
import 'package:freshlii_store_trial_2/models/order_summary.dart';
import 'package:freshlii_store_trial_2/providers/onlineProvider.dart';
import 'package:freshlii_store_trial_2/providers/summaryProvider.dart';
import 'package:freshlii_store_trial_2/screens/dashboard/summaryTile.dart';
import 'package:freshlii_store_trial_2/screens/orders/activeOrders/activeOrderScreen.dart';
import 'package:freshlii_store_trial_2/screens/orders/fullOrders/futureOrdersScreen.dart';
import 'package:provider/provider.dart';

import '../../app_properties.dart';

class LandingPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var onlineProvider = Provider.of<OnlineProvider>(context);
    var summaryProvider = Provider.of<SummaryProvider>(context, listen: false);
    summaryProvider.getOrderSummary("29", "1", "10", "1");
    bool isOnline = onlineProvider.isOnline;

    print(summaryProvider.orderSummary.message);
    return Scaffold(
      appBar: CustomAppBar(
        displayText: "Store Dashboard",
      ),
      drawer: myDrawer(),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Card(
                margin: EdgeInsets.all(15),
                elevation: 5,
                child: Container(
                  width: MediaQuery.of(context).size.width / 2 - 30,
                  height: MediaQuery.of(context).size.height / 10,
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      customTextBold("2", green, 25),
                      customTextBold("Active Orders", Colors.black, 10),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  onlineProvider.switchAvailability(context);
                },
                child: Card(
                  margin: EdgeInsets.all(15),
                  elevation: 5,
                  color: isOnline ? green : red,
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2 - 30,
                    height: MediaQuery.of(context).size.height / 10,
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        customTextBold(
                            isOnline ? "Online" : "Offline", white, 25),
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              color: isOnline
                                  ? Colors.lightGreen
                                  : Colors.redAccent,
                              borderRadius: BorderRadius.circular(25)),
                        )
                        //customTextBold("Store Rating", grey, 10),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          /*Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                width: MediaQuery.of(context).size.width / 2 - 50,
                height: MediaQuery.of(context).size.width / 5,
                child: Stack(
                  children: [
                    Positioned(
                        top: 5, right: 5, child: Icon(Icons.error_outline)),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "2",
                          style: TextStyle(
                            color: green,
                            fontSize: 25,
                          ),
                        ),
                        Text("Active Orders"),
                      ],
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  onlineProvider.switchAvailability();
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  width: MediaQuery.of(context).size.width / 2 - 50,
                  height: MediaQuery.of(context).size.width / 5,
                  decoration: BoxDecoration(
                    color: isOnline ? green : red,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        isOnline ? "Online" : "Offline",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: white, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            color:
                                isOnline ? Colors.lightGreen : Colors.redAccent,
                            borderRadius: BorderRadius.circular(25)),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),*/
          Card(
            elevation: 5,
            margin: EdgeInsets.all(15),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      customTextBold("22", red, 50),
                      customTextBold("Orders Today", red, 15),
                    ],
                  ),
                ),
                Divider(),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Column(
                          children: [
                            customTextBold("17", red, 25),
                            customTextBold("Orders Yesterday", red, 10),
                          ],
                        ),
                      ),
                      Divider(),
                      Container(
                        child: Column(
                          children: [
                            customTextBold("132", red, 25),
                            customTextBold("Last 7 Days", red, 10),
                          ],
                        ),
                      ),
                      Divider(),
                      Container(
                        child: Column(
                          children: [
                            customTextBold("514", red, 25),
                            customTextBold("Last 30 Days", red, 10),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Card(
            elevation: 5,
            margin: EdgeInsets.all(15),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      customTextBold("\$643", green, 50),
                      customTextBold("Orders Today", green, 15),
                    ],
                  ),
                ),
                Divider(),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Column(
                          children: [
                            customTextBold("\$1643", green, 25),
                            customTextBold("Orders Yesterday", green, 10),
                          ],
                        ),
                      ),
                      Divider(),
                      Container(
                        child: Column(
                          children: [
                            customTextBold("\$7643", green, 25),
                            customTextBold("Last 7 Days", green, 10),
                          ],
                        ),
                      ),
                      Divider(),
                      Container(
                        child: Column(
                          children: [
                            customTextBold("\$21643", green, 25),
                            customTextBold("Last 30 Days", green, 10),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Card(
                margin: EdgeInsets.all(15),
                elevation: 5,
                child: Container(
                  width: MediaQuery.of(context).size.width / 2 - 30,
                  height: MediaQuery.of(context).size.height / 10,
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      customTextBold("\$53.23", green, 25),
                      customTextBold("Average Basket Price", green, 10),
                    ],
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.all(15),
                elevation: 5,
                child: Container(
                  width: MediaQuery.of(context).size.width / 2 - 30,
                  height: MediaQuery.of(context).size.height / 10,
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      customTextBold("4.3", Colors.yellow, 25),
                      customTextBold("Store Rating", grey, 10),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();

    final summaryProvider =
        Provider.of<SummaryProvider>(context, listen: false);
    summaryProvider.getOrderSummary("29", "1", "10", "1");
  }

  @override
  Widget build(BuildContext context) {
    var onlineProvider = Provider.of<OnlineProvider>(context);
    var summaryProvider = Provider.of<SummaryProvider>(context, listen: true);
    //summaryProvider.getOrderSummary("29", "1", "10", "1");
    final OrderSummary summary = summaryProvider.orderSummary;
    List<ResponseElement> bucketLists =
        summary.data.response.response.response.response;
    bucketLists.sort((a,b) => b.intervalDays.compareTo(a.intervalDays));
    bool isOnline = onlineProvider.isOnline;

    print(summaryProvider.orderSummary.message);
    return Scaffold(
      appBar: CustomAppBar(
        displayText: "Store Dashboard",
      ),
      drawer: myDrawer(),
      body: SingleChildScrollView(
        child: Container(
          //height: MediaQuery.of(context).size.height - 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Card(
                    margin: EdgeInsets.all(15),
                    elevation: 5,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2 - 30,
                      height: MediaQuery.of(context).size.height / 10,
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          customTextBold("2", green, 25),
                          customTextBold("Active Orders", Colors.black, 10),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      onlineProvider.switchAvailability(context);
                    },
                    child: Card(
                      margin: EdgeInsets.all(15),
                      elevation: 5,
                      color: isOnline ? green : red,
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2 - 30,
                        height: MediaQuery.of(context).size.height / 10,
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            customTextBold(
                                isOnline ? "Online" : "Offline", white, 25),
                            Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                  color: isOnline
                                      ? Colors.lightGreen
                                      : Colors.redAccent,
                                  borderRadius: BorderRadius.circular(25)),
                            )
                            //customTextBold("Store Rating", grey, 10),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Text("Orders", style: textFieldStyleSizeColor(25, green),),
              Container(
                height: MediaQuery.of(context).size.width/2,
                margin: EdgeInsets.all(10),

                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.all(color: green),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3
                    ),
                    itemCount: bucketLists.length,
                    itemBuilder: (context, index) {
                      final bucket = bucketLists[index];
                      return SummaryTile(responseElement: bucket,);
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Card(
                    margin: EdgeInsets.all(15),
                    elevation: 5,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2 - 30,
                      height: MediaQuery.of(context).size.height / 10,
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          customTextBold("\$53.23", green, 25),
                          customTextBold("Average Basket Price", green, 10),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.all(15),
                    elevation: 5,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2 - 30,
                      height: MediaQuery.of(context).size.height / 10,
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          customTextBold("4.3", Colors.yellow, 25),
                          customTextBold("Store Rating", grey, 10),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              InkWell(onTap: () {changeScreenPush(context, FutureOrderScreen());}, child: Container(
                margin: EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width/2,
                padding: EdgeInsets.all(15),

                decoration: BoxDecoration(
                  color: green,
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.chevron_right, color: white,),
                    Text("View Orders", style: textFieldStyleSizeColor(20, white),)
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
