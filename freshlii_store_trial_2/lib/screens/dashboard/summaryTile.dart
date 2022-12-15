import 'package:flutter/material.dart';
import 'package:freshlii_store_trial_2/app_properties.dart';
import 'package:freshlii_store_trial_2/models/order_summary.dart';


class SummaryTile extends StatelessWidget {
  final ResponseElement responseElement;
  SummaryTile({this.responseElement});
  @override
  Widget build(BuildContext context) {
    if(responseElement.intervalDays < 0){
      return Card(
        color: grey.withOpacity(0.7 ),
        margin: EdgeInsets.all(10),
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(5),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("${responseElement.intervalText}", style: textFieldStyleColorMedium(white) ,),
                  Divider(thickness: 1,color: white,),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text("${responseElement.orderCount}", style: textFieldStyleColorSmall(white),),
                      Text("orders", style: textFieldStyleColorSmall(white),),
                    ],
                  ),
                  Divider(thickness: 1,color: white,),
                  Column(
                    children: [
                      Text("\$${responseElement.actualSale.toStringAsFixed(2)}", style:textFieldStyleColorSmall(white)),
                      Text("sales", style: textFieldStyleColorSmall(white),),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    } else if (responseElement.intervalDays > 0) {
      return Card(
        color: lightgreen.withOpacity(0.7 ),
        margin: EdgeInsets.all(10),
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(5),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("${responseElement.intervalText}", style: textFieldStyleColorMedium(green) ,),
                  Divider(thickness: 1,),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text("${responseElement.orderCount}", style: textFieldStyleColorSmall(green),),
                      Text("orders", style: textFieldStyleColorSmall(green),),
                    ],
                  ),
                  Divider(thickness: 1,),
                  Column(
                    children: [
                      Text("\$${responseElement.actualSale}",style: textFieldStyleColorSmall(green)),
                      Text("sales", style: textFieldStyleColorSmall(green)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    } else {
      return Card(
        color: lightgreen,
        shape: Border.all(
          color: green,width: 3
        ),
        margin: EdgeInsets.all(10),
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(5),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("${responseElement.intervalText}", style: textFieldStyleColorMedium(green) ,),
                  Divider(thickness: 1,),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text("${responseElement.orderCount}", style: textFieldStyleColorSmall(green),),
                      Text("orders", style: textFieldStyleColorSmall(green),),
                    ],
                  ),
                  Divider(thickness: 1,),
                  Column(
                    children: [
                      Text("\$${responseElement.actualSale}",style: textFieldStyleColorSmall(green)),
                      Text("sales",style: textFieldStyleColorSmall(green)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }

  }
}
