import 'package:flutter/material.dart';
import 'package:flutter_delivery_trial1/components/appBar.dart';
import 'package:flutter_delivery_trial1/components/drawer.dart';
import 'package:flutter_delivery_trial1/app_properties.dart';
import 'package:flutter_delivery_trial1/screens/deliveryScreen.dart';

import 'package:provider/provider.dart';

class PickupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        displayText: "Pickup Rounds",
      ),
      drawer: myDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
              decoration: BoxDecoration(
                  color: green, borderRadius: BorderRadius.circular(10)),
              child: ExpansionTile(
                //backgroundColor: lightgreen,
                title: Container(
                  child: Text(
                    "Macelleria Masseronia",
                    style: textFieldStyleSizeColor(18, white),
                  ),
                ),
                children: [
                  Container(
                    decoration: BoxDecoration(
                      //borderRadius: BorderRadius.circular(10),
                      color: lightgreen,
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: green),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                                child: Column(
                                  children: [
                                    Text("Pickup#:", style: textFieldStyleSizeColor(12, lightgrey),),
                                    Text("MM-001", style: textFieldStyleSize(15),)
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                                child: Column(
                                  children: [
                                    Text("Bag Count:", style: textFieldStyleSizeColor(12, lightgrey),),
                                    Text("2", style: textFieldStyleSize(15),)
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                                child: Column(
                                  children: [
                                    Text("Delivery Box#:", style: textFieldStyleSizeColor(12, lightgrey),),
                                    Text("BOX 7", style: textFieldStyleSize(15),)
                                  ],
                                ),
                              ),
                              Checkbox(value: true, onChanged: null)
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: green),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                                child: Column(
                                  children: [
                                    Text("Pickup#:", style: textFieldStyleSizeColor(12, lightgrey),),
                                    Text("MM-002", style: textFieldStyleSize(15),)
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                                child: Column(
                                  children: [
                                    Text("Bag Count:", style: textFieldStyleSizeColor(12, lightgrey),),
                                    Text("5", style: textFieldStyleSize(15),)
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                                child: Column(
                                  children: [
                                    Text("Delivery Box#:", style: textFieldStyleSizeColor(12, lightgrey),),
                                    Text("BOX 3", style: textFieldStyleSize(15),)
                                  ],
                                ),
                              ),
                              Checkbox(value: true, onChanged: null)
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: green),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                                child: Column(
                                  children: [
                                    Text("Pickup#:", style: textFieldStyleSizeColor(12, lightgrey),),
                                    Text("MM-003", style: textFieldStyleSize(15),)
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                                child: Column(
                                  children: [
                                    Text("Bag Count:", style: textFieldStyleSizeColor(12, lightgrey),),
                                    Text("6", style: textFieldStyleSize(15),)
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                                child: Column(
                                  children: [
                                    Text("Delivery Box#:", style: textFieldStyleSizeColor(12, lightgrey),),
                                    Text("BOX 9", style: textFieldStyleSize(15),)
                                  ],
                                ),
                              ),
                              Checkbox(value: true, onChanged: null)
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: green),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                                child: Column(
                                  children: [
                                    Text("Pickup#:", style: textFieldStyleSizeColor(12, lightgrey),),
                                    Text("MM-008", style: textFieldStyleSize(15),)
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                                child: Column(
                                  children: [
                                    Text("Bag Count:", style: textFieldStyleSizeColor(12, lightgrey),),
                                    Text("1", style: textFieldStyleSize(15),)
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                                child: Column(
                                  children: [
                                    Text("Delivery Box#:", style: textFieldStyleSizeColor(12, lightgrey),),
                                    Text("BOX 1", style: textFieldStyleSize(15),)
                                  ],
                                ),
                              ),
                              Checkbox(value: false, onChanged: null)
                            ],
                          ),
                        ),

                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: green),
                            color: green,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                          child: Text("Complete", style: textFieldStyleSizeColor(15, white),textAlign: TextAlign.center,),
                        )
                      ],
                    )
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
              decoration: BoxDecoration(
                  color: green, borderRadius: BorderRadius.circular(10)),
              child: ExpansionTile(
                //backgroundColor: lightgreen,
                title: Container(
                  child: Text(
                    "Little Italy",
                    style: textFieldStyleSizeColor(18, white),
                  ),
                ),
                children: [
                  Container(
                      decoration: BoxDecoration(
                        //borderRadius: BorderRadius.circular(10),
                        color: lightgreen,
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [


                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: green),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                                  child: Column(
                                    children: [
                                      Text("Pickup#:", style: textFieldStyleSizeColor(12, lightgrey),),
                                      Text("MM-001", style: textFieldStyleSize(15),)
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                                  child: Column(
                                    children: [
                                      Text("Bag Count:", style: textFieldStyleSizeColor(12, lightgrey),),
                                      Text("2", style: textFieldStyleSize(15),)
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                                  child: Column(
                                    children: [
                                      Text("Delivery Box#:", style: textFieldStyleSizeColor(12, lightgrey),),
                                      Text("BOX 7", style: textFieldStyleSize(15),)
                                    ],
                                  ),
                                ),
                                Checkbox(value: false, onChanged: null)
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: green),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                                  child: Column(
                                    children: [
                                      Text("Pickup#:", style: textFieldStyleSizeColor(12, lightgrey),),
                                      Text("MM-001", style: textFieldStyleSize(15),)
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                                  child: Column(
                                    children: [
                                      Text("Bag Count:", style: textFieldStyleSizeColor(12, lightgrey),),
                                      Text("2", style: textFieldStyleSize(15),)
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                                  child: Column(
                                    children: [
                                      Text("Delivery Box#:", style: textFieldStyleSizeColor(12, lightgrey),),
                                      Text("BOX 7", style: textFieldStyleSize(15),)
                                    ],
                                  ),
                                ),
                                Checkbox(value: false, onChanged: null)
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: green),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                                  child: Column(
                                    children: [
                                      Text("Pickup#:", style: textFieldStyleSizeColor(12, lightgrey),),
                                      Text("MM-001", style: textFieldStyleSize(15),)
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                                  child: Column(
                                    children: [
                                      Text("Bag Count:", style: textFieldStyleSizeColor(12, lightgrey),),
                                      Text("2", style: textFieldStyleSize(15),)
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                                  child: Column(
                                    children: [
                                      Text("Delivery Box#:", style: textFieldStyleSizeColor(12, lightgrey),),
                                      Text("BOX 7", style: textFieldStyleSize(15),)
                                    ],
                                  ),
                                ),
                                Checkbox(value: false, onChanged: null)
                              ],
                            ),
                          ),

                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: green),
                              color: green,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                            child: Text("Complete", style: textFieldStyleSizeColor(15, white),textAlign: TextAlign.center,),
                          )
                        ],
                      )
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
              decoration: BoxDecoration(
                  color: green, borderRadius: BorderRadius.circular(10)),
              child: ExpansionTile(
                //backgroundColor: lightgreen,
                title: Container(
                  child: Text(
                    "Italy Mart",
                    style: textFieldStyleSizeColor(18, white),
                  ),
                ),
                children: [
                  Container(
                      decoration: BoxDecoration(
                        //borderRadius: BorderRadius.circular(10),
                        color: lightgreen,
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: green),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                                  child: Column(
                                    children: [
                                      Text("Pickup#:", style: textFieldStyleSizeColor(12, lightgrey),),
                                      Text("MM-001", style: textFieldStyleSize(15),)
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                                  child: Column(
                                    children: [
                                      Text("Bag Count:", style: textFieldStyleSizeColor(12, lightgrey),),
                                      Text("2", style: textFieldStyleSize(15),)
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                                  child: Column(
                                    children: [
                                      Text("Delivery Box#:", style: textFieldStyleSizeColor(12, lightgrey),),
                                      Text("BOX 7", style: textFieldStyleSize(15),)
                                    ],
                                  ),
                                ),
                                Checkbox(value: false, onChanged: null)
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: green),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                                  child: Column(
                                    children: [
                                      Text("Pickup#:", style: textFieldStyleSizeColor(12, lightgrey),),
                                      Text("MM-001", style: textFieldStyleSize(15),)
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                                  child: Column(
                                    children: [
                                      Text("Bag Count:", style: textFieldStyleSizeColor(12, lightgrey),),
                                      Text("2", style: textFieldStyleSize(15),)
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                                  child: Column(
                                    children: [
                                      Text("Delivery Box#:", style: textFieldStyleSizeColor(12, lightgrey),),
                                      Text("BOX 7", style: textFieldStyleSize(15),)
                                    ],
                                  ),
                                ),
                                Checkbox(value: false, onChanged: null)
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: green),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                                  child: Column(
                                    children: [
                                      Text("Pickup#:", style: textFieldStyleSizeColor(12, lightgrey),),
                                      Text("MM-001", style: textFieldStyleSize(15),)
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                                  child: Column(
                                    children: [
                                      Text("Bag Count:", style: textFieldStyleSizeColor(12, lightgrey),),
                                      Text("2", style: textFieldStyleSize(15),)
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                                  child: Column(
                                    children: [
                                      Text("Delivery Box#:", style: textFieldStyleSizeColor(12, lightgrey),),
                                      Text("BOX 7", style: textFieldStyleSize(15),)
                                    ],
                                  ),
                                ),
                                Checkbox(value: false, onChanged: null)
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: green),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                                  child: Column(
                                    children: [
                                      Text("Pickup#:", style: textFieldStyleSizeColor(12, lightgrey),),
                                      Text("MM-001", style: textFieldStyleSize(15),)
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                                  child: Column(
                                    children: [
                                      Text("Bag Count:", style: textFieldStyleSizeColor(12, lightgrey),),
                                      Text("2", style: textFieldStyleSize(15),)
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                                  child: Column(
                                    children: [
                                      Text("Delivery Box#:", style: textFieldStyleSizeColor(12, lightgrey),),
                                      Text("BOX 7", style: textFieldStyleSize(15),)
                                    ],
                                  ),
                                ),
                                Checkbox(value: false, onChanged: null)
                              ],
                            ),
                          ),

                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: green),
                              color: green,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                            child: Text("Complete", style: textFieldStyleSizeColor(15, white),textAlign: TextAlign.center,),
                          )
                        ],
                      )
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                changeScreenPushReplacement(context, DeliveryScreen());
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: red,
                ),
                child: Text("Start Delivering !", style: textFieldStyleSizeColor(18, white),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
