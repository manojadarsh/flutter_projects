import 'package:flutter/material.dart';
import 'package:freshlii_store_trial_2/models/orders.dart';
import 'package:http/http.dart' as http;


class OrdersProvider with ChangeNotifier {

  Future<Orders> getOrders(String storeID) async {
    final queryParameters = {
      "store_id": storeID,
    };
    try {
      //TODO this is the issue - must fix.
      final uri = Uri.http("shopfreshlii.a3jm.com:3060", '/orders/orders', queryParameters);
      //print(uri);
      final response = await http.get(uri);
      //print(response.statusCode);
      //print(response.body);
      if (response.statusCode == 200) {

        print(response.body);
        final Orders orders = ordersFromJson(response.body);
        //print(orders);
        print("HI");
        print("HI");
        _orders = orders;
        print(_orders.message);
        //print("lenght: ${_orders.length}");
        // for(store in _stores) {
        //   store.products = Products().products(store.storeId);
        // }for(store in _stores) {
        //   store.products = Products().products(store.storeId);
        // }
        //check if this is correct
        notifyListeners();
        //return stores;

      } else {
        print("error1");
        return Orders();
      }
    } catch (e) {
      print(e.toString());
      return Orders();
    }
    //notifyListeners();
    print(_orders);
  }


  Orders _orders = Orders();

  Orders orders (String storeID){

    getOrders(storeID);

    //print("cpp; + $s_length");
    //notifyListeners();
    return _orders;
  }

}