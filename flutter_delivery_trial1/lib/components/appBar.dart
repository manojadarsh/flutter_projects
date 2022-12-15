import 'package:flutter/material.dart';
import 'package:flutter_delivery_trial1/app_properties.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget{
  final String displayText;
  @override
  final Size preferredSize;


  CustomAppBar(
      { Key key, this.displayText}) : preferredSize = Size.fromHeight(50.0),
        super(key: key);
  @override
  Widget build(BuildContext context) {


    return PreferredSize(
      preferredSize: Size.fromHeight(120),
      child: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: green
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        flexibleSpace: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            customTextBold("$displayText", green, 20),
            Text(DateFormat.yMMMMd('en_US').format(DateTime.now()), style: TextStyle(
              color: red
            ),),
          ],
        ),
        /*bottom: PreferredSize(
          child: Container(
            height: 20,
            decoration: BoxDecoration(

            ),
            child: Text("Status: ${isOnline ? "Online" : "Offline"}", style: TextStyle(
              color: isOnline ? Colors.lightGreen : Colors.grey,

            ),),
          ),
        ),*/
      ),
    );
  }
}
