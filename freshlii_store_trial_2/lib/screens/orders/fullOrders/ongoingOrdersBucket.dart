import 'package:flutter/material.dart';
import 'package:freshlii_store_trial_2/models/orders_full.dart';
import 'package:freshlii_store_trial_2/screens/orders/fullOrders/ordersDisplay.dart';
import 'package:provider/provider.dart';

class OnGoingOrderBucket extends StatelessWidget {
  final ResponseElement bucket;

  OnGoingOrderBucket({this.bucket});


  @override
  Widget build(BuildContext context) {
    var orders = bucket.orderInfo.orders;
    return Container(
      child: Column(
        children: [
          Text("${bucket.startDate.day}/${bucket.startDate.month
          }/${bucket.startDate.year} - ${bucket.endDate.day}/${bucket.endDate.month
          }/${bucket.endDate.year}"),
          Text("Orders"),
          Container(
            height: 400,
            child: ListView.builder(itemCount: orders.length,
                itemBuilder: (context, index) => ChangeNotifierProvider.value(
                  value: orders[index],
                  child: OrdersDisplay(),
                )),
          )

        ],
      ),
    );
  }
}
