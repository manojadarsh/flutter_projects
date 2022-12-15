import 'package:flutter/material.dart';
import 'package:freshlii_store_trial_2/components/appBar.dart';
import 'package:freshlii_store_trial_2/components/drawer.dart';
import 'package:freshlii_store_trial_2/screens/orders/activeOrders/activeOrderList.dart';

class ActiveOrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: myDrawer(),
      appBar: CustomAppBar(
        displayText: "Active Orders",
      ),
      body: Container(
        child: ActiveOrderList(),
      ),
    );
  }
}
