import 'package:flutter/material.dart';
import 'orderServices.dart';
import 'package:json_list/models/order.dart';

class JsonParseOrder extends StatefulWidget {
  @override
  _JsonParseOrderState createState() => _JsonParseOrderState();
}

class _JsonParseOrderState extends State<JsonParseOrder> {
  List<Order> _orders;
  bool _isloading = true;

  @override
  void initState(){
    super.initState();
    _isloading = true;
    orderServices.getOrders().then((orders) {
      setState(() {
        _orders = orders;
        _isloading = false;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isloading ? 'Loading ...' : "Order"),
      ),
      body: Container(
          color: Colors.white,
          child: ListView.builder(
              itemBuilder: (context, index){
                Order order = _orders[index];
                return ListTile(
                  title: Text(order.productName),
                  subtitle: Text(order.productDescription),
                  leading: Text(order.orderNo.toString()),
                );
              },
          )
      ),
    );
  }
}
