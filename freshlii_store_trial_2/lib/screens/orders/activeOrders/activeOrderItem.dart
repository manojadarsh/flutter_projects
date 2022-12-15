import 'package:flutter/material.dart';
import 'package:freshlii_store_trial_2/app_properties.dart';
import 'package:freshlii_store_trial_2/models/orders.dart';
import 'file:///C:/Users/manoj/IdeaProjects/freshlii_store_trial_2/lib/screens/orders/activeOrders/orderScreen.dart';
import 'package:provider/provider.dart';
class ActiveOrderItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final order = Provider.of<Order>(context);

    return GestureDetector(
      onTap: () {
        changeScreenPush(context, OrderScreen(order));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
       // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.green),
          borderRadius: BorderRadius.circular(15)
        ),
        child: ListTile(
          leading: Text("AO Order: ${order.customerReference}", style: textFieldStyle(),),
          trailing: Icon(Icons.arrow_forward_ios_outlined, color: red,),
        )
      ),
    );
  }
}
