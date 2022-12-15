import 'package:flutter/material.dart';
import 'package:freshlii_store_trial_2/screens/orders/activeOrders/activeOrderItem.dart';
import 'package:freshlii_store_trial_2/models/orders.dart';
import 'package:freshlii_store_trial_2/providers/ordersProvider.dart';
import 'package:provider/provider.dart';

class ActiveOrderList extends StatelessWidget {
  final String storeID = "29";

  @override
  Widget build(BuildContext context) {
    final ordersProvider = Provider.of<OrdersProvider>(context);
    final ordersList = ordersProvider.orders(storeID);

    List<Order> orders = ordersList.data.storeOrders.response.orders;
    print(ordersList);

    return Container(
      child: ListView.builder(itemCount: orders.length,
          itemBuilder: (context, index) => ChangeNotifierProvider.value(
                value: orders[index],
                child: ActiveOrderItem(),
              )),
    );
  }
}
