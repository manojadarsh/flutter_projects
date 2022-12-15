import 'package:flutter/material.dart';
import 'package:json_list/api_service/jsonParseOrders.dart';
import 'package:json_list/api_service/jsonParseDemo.dart';
import 'package:json_list/api_service/jsonParseProducts.dart';


import 'models/note.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: JsonParseProduct(),
    );
  }
}