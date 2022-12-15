import 'package:flutter/material.dart';
import 'package:freshlii_store_trial_2/models/orders_full.dart';
import 'package:freshlii_store_trial_2/providers/ordersFullProvider.dart';
import 'package:freshlii_store_trial_2/screens/orders/fullOrders/ongoingOrdersBucket.dart';
import 'package:provider/provider.dart';

import '../../../app_properties.dart';

class FutureOrderScreen extends StatefulWidget {
  @override
  _FutureOrderScreenState createState() => _FutureOrderScreenState();
}

class _FutureOrderScreenState extends State<FutureOrderScreen> {

  OrdersFull ordersFull;
  ResponseElement bucketToday;
  ResponseElement bucketTomorrow;
  ResponseElement bucketWeek;
  @override
  void initState() {
    super.initState();
    final ordersFullProvider = Provider.of<OrdersFullProvider>(context, listen: false);
    ordersFullProvider.getOrdersFull("29", "1", "10", "1");

    // final initOrder = ordersFullProvider.orderFull.data.response.response.response.response;
    // for(int x = 0; x < initOrder.length; x++) {
    //   if(initOrder[x].bucket == 0){
    //     bucketToday = initOrder[x];
    //   } else if (initOrder[x].bucket == 4) {
    //     bucketTomorrow = initOrder[x];
    //     print(bucketTomorrow.bucket);
    //   } else if (initOrder[x].bucket == 5) {
    //     bucketWeek = initOrder[x];
    //     print(bucketWeek.bucket);
    //   }
    //   print("no match");
    // }

    //print(ordersFullProvider.orderFull.message);
  }


  @override
  Widget build(BuildContext context) {
    final ordersFullProvider = Provider.of<OrdersFullProvider>(context);
    ordersFull = ordersFullProvider.orderFull;
    bucketToday = ordersFullProvider.bucketToday;
    bucketTomorrow = ordersFullProvider.bucketTomorrow;
    bucketWeek = ordersFullProvider.bucketWeek;
    print(bucketToday.bucket);
    print(bucketTomorrow.bucket);
    print(bucketWeek.orderInfo.orders.length);
    //print("hishdalda ${bucketToday.bucket}");
     //print("hishdalda ${bucketWeek.bucket}");
    // print("hishdalda ${bucketTomorrow.bucket}");
    return DefaultTabController(length: 3, child: Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: green, //change your color here
        ),
        backgroundColor: white,

        title: Text('OnGoing Orders', style: textFieldStyleSize(20),),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10)),
        ),
        bottom: TabBar(
          labelColor: white,
          indicator: BoxDecoration(
              color: green,
              borderRadius: BorderRadius.circular(10)
          ),
          indicatorColor: green,
          unselectedLabelColor: lightgrey,
          tabs: [
            Tab(icon: Icon(Icons.today_outlined),text: "Today",),
            Tab(icon: Icon(Icons.watch_later_outlined),text: "Tomorrow",),
            Tab(icon: Icon(Icons.next_plan_outlined),text: "Next 7 Days"),
          ],
        ),
      ),
      body: TabBarView(
        children: [
          OnGoingOrderBucket(bucket: bucketToday,),
          OnGoingOrderBucket(bucket: bucketTomorrow,),
          OnGoingOrderBucket(bucket: bucketWeek,),
        ],
      ),
    ));
  }
}
