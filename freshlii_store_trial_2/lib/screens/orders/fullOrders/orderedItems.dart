import 'package:flutter/material.dart';
import 'package:freshlii_store_trial_2/components/appBar.dart';
import 'package:freshlii_store_trial_2/components/drawer.dart';
import 'package:freshlii_store_trial_2/app_properties.dart';
import 'package:freshlii_store_trial_2/models/orders_full.dart';
import 'package:freshlii_store_trial_2/screens/orders/fullOrders/orderedItem.dart';
import 'package:provider/provider.dart';



class OrderedItems extends StatelessWidget {
  final Order order;
  OrderedItems(this.order);
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //     drawer: myDrawer(),
    //     appBar: CustomAppBar(
    //       displayText: "${order.customerReference}",
    //     ),
    //     body: Container(
    //       child: ListView.builder(
    //           itemCount: order.orderDetails.items.length,
    //           itemBuilder: (context, index) => ChangeNotifierProvider.value(
    //             value: order.orderDetails.items[index],
    //             child: OrderedItem(),
    //           )),
    //     )
    // );

    return Container(
          child: ListView.builder(
              itemCount: order.orderDetails.items.length,
              itemBuilder: (context, index) => ChangeNotifierProvider.value(
                value: order.orderDetails.items[index],
                child: OrderedItem(),
              )),
        );
  }
}
