import 'package:flutter/material.dart';
import 'package:freshlii_store_trial_2/app_properties.dart';
import 'package:freshlii_store_trial_2/models/orders_full.dart';
import 'package:freshlii_store_trial_2/screens/orders/fullOrders/orderedItems.dart';
import 'package:provider/provider.dart';
import 'package:freshlii_store_trial_2/screens/orders/fullOrders/orderedItem.dart';

class OrdersDisplay extends StatelessWidget {
  showAlertDialog(BuildContext context, Order order) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Continue"),
      onPressed: () {},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("${order.customerReference}"),
      content: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width,
          child: OrderedItems(order)),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final order = Provider.of<Order>(context);
    return GestureDetector(
      onTap: () {
        showAlertDialog(context, order);
        // changeScreenPush(context, OrderedItems(order));
      },
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.green),
              borderRadius: BorderRadius.circular(15)),
          child: ListTile(
            leading: Text(
              "Order: ${order.customerReference}",
              style: textFieldStyle(),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_outlined,
              color: red,
            ),
          )),
    );
  }
}
