import 'package:flutter/material.dart';
import 'package:flutter_delivery_trial1/components/appBar.dart';
import 'package:flutter_delivery_trial1/components/drawer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../app_properties.dart';

class DeliveryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    String url= 'tel:+91224578781';

    Future<void> callnow() async{
      if(await canLaunch(url))
      {
        await launch(url);
      }else
      {
        throw 'call not possible';
      }
    }

    showAlertDialog(BuildContext context, String orderNumber, String name, String phoneNumber, String address, String customerNotes) {

      // set up the buttons
      Widget cancelButton = FlatButton(
        child: Text("Cancel"),
        onPressed:  () {Navigator.pop(context);},
      );
      Widget continueButton = FlatButton(
        child: Text("Continue"),
        onPressed:  () {},
      );

      Widget callCustomer =Container(
          margin: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
          width: MediaQuery.of(context).size.width/5,
          child: IconButton(
            icon: Icon(Icons.call),
            onPressed: () {

              launch("tel:$phoneNumber");
            },
          )
      );

      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        title: Text("Order # $orderNumber", style: textFieldStyleSize(20),),
        content: Container(

          child: Column(
            children: [
              Container(padding: EdgeInsets.symmetric(vertical: 10),child: Text("Customer Details", style: textFieldStyleSizeColor(16, grey), textAlign: TextAlign.start,)),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  children: [
                    Text("Name: ", style: textFieldStyleSize(12),),
                    Text("$name", style: textFieldStyleSizeColor(12, grey),),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  children: [
                    Text("Phone Number: ", style: textFieldStyleSize(12),),
                    Text("$phoneNumber", style: textFieldStyleSizeColor(12, grey),),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  children: [
                    Text("Address: ", style: textFieldStyleSize(12),),
                    Text("$address", style: textFieldStyleSizeColor(12, grey),),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Wrap(
                  children: [
                    Text("Customer Notes: ", style: textFieldStyleSize(12),),
                    Container(child: Wrap(
                      children: [
                        Text("$customerNotes", style: textFieldStyleSizeColor(12, grey),),
                      ],
                    )),
                  ],
                ),
              ),
            ],
          ),
        ),
        actions: [
          cancelButton,
          continueButton,
          callCustomer
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
    return Scaffold(
      appBar: CustomAppBar(displayText: "Delivery Rounds",),
      drawer: myDrawer(),
      body: Column(
        children: [
          InkWell(
            onTap: () {
             showAlertDialog(context, "F1-10001", "Micherala Manasd", "+39 123 4567890", "143 Via Marco Milano, IT", "Deliver it to the granny in the organe and blue sweater");
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: green),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width/5,
                    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                    child: Column(
                      children: [
                        Text("Delivery Address#:", style: textFieldStyleSizeColor(12, grey),),
                        Text("143 Vai asdkjA asd", style: textFieldStyleSize(15),overflow: TextOverflow.ellipsis,),

                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                    width: MediaQuery.of(context).size.width/5,
                    child: Column(
                      children: [
                        Text("Box:", style: textFieldStyleSizeColor(12, grey),),
                        Text("BOX 2", style: textFieldStyleSize(15),)
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                    width: MediaQuery.of(context).size.width/5,
                    child: Column(
                      children: [
                        Text("Name:", style: textFieldStyleSizeColor(12, grey),),
                        Text("Michael Adnasldn", overflow: TextOverflow.ellipsis, style: textFieldStyleSize(15),)
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                    width: MediaQuery.of(context).size.width/5,
                    child: Checkbox(
                      onChanged: null, value: true,
                    )
                  ),
                  //Checkbox(value: false, onChanged: null)
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: InkWell(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: red,
          ),
          child: Text("Done Delivering for Today!", style: textFieldStyleSizeColor(18, white),),
        ),
      ),
    );
  }
}
