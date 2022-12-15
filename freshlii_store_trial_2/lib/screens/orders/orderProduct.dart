import 'package:flutter/material.dart';
import 'package:freshlii_store_trial_2/models/orders.dart';
import 'package:provider/provider.dart';

import '../../app_properties.dart';

class OrderProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final item = Provider.of<Item>(context);
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        color: lightgreen,
        borderRadius: BorderRadius.circular(15),

      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("${item.productName}"),
          Text("x${item.bookedQuantity}"),

        ],
      ),
    );
  }
}
