import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:freshlii_store_trial_2/models/orders_full.dart';
import 'package:freshlii_store_trial_2/app_properties.dart';

class OrderedItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final item = Provider.of<Item>(context);
    TextEditingController amendedQuantityTEC = TextEditingController(text: item.amendedQuantity == null ? item.bookedQuantity.toString() : item.amendedQuantity.toString());
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      decoration: BoxDecoration(
        color: lightgreen,
        borderRadius: BorderRadius.circular(15),

      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("${item.productName}", style: textFieldStyleSize(10),),
          Text("x${item.bookedQuantity}", style: textFieldStyleSize(10),),
          Text(item.amendedQuantity == null ? "n/a":"x${item.amendedQuantity}", style: textFieldStyleSize(10),),
          Container(
            width: 10,
            child: TextField(
              textAlign: TextAlign.center,
                style: TextStyle(

                    fontSize: 10,
                    //height: 2.0,
                    color: Colors.black
                ),
              decoration: InputDecoration(
                hintText: item.amendedQuantity == null ? item.bookedQuantity.toString() : item.amendedQuantity.toString(),
              ),
              keyboardType: TextInputType.number,
              controller: amendedQuantityTEC,
            ),
          ),
          IconButton(onPressed: () {
            item.setAmendedQuantity(double.parse(amendedQuantityTEC.text));
          },icon: Icon(Icons.check),
          )

        ],
      ),
    );
  }
}
