import 'package:flutter/material.dart';
import 'package:freshlii_store_trial_2/models/order_summary.dart';
import 'package:http/http.dart' as http;



class SummaryProvider with ChangeNotifier {

  Future<OrderSummary> getOrderSummary(String storeID, String appID, String companyID, String brandID) async {
    final queryParameters = {
      "store_id": storeID,
      "app_id" : appID,
      "company_id" : companyID,
      "brand_id" : brandID,
      "level" : "summary"
    };
    try {
      //TODO this is the issue - must fix.
      final uri = Uri.http("shopfreshlii.a3jm.com:3085", '/store-admin/get-store-dashboard', queryParameters);
      //print(uri);
      final response = await http.get(uri);
      //print(response.statusCode);
      //print(response.body);
      if (response.statusCode == 200) {

        print(response.body);
        final OrderSummary orderSummary = orderSummaryFromJson(response.body);
        //print(orders);
        print("HI");
        print("HI");
        _orderSummary = orderSummary;
        print(_orderSummary.message);
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
        return OrderSummary();
      }
    } catch (e) {
      print(e.toString());
      return OrderSummary();
    }
    //notifyListeners();
    print(_orderSummary);
  }


  OrderSummary _orderSummary = OrderSummary();

  OrderSummary orderSummary1 (String storeID, String appID, String companyID, String brandID){

    getOrderSummary(storeID, appID, companyID, brandID);

    //print("cpp; + $s_length");
    //notifyListeners();
    return _orderSummary;
  }

  OrderSummary get orderSummary{


    //print("cpp; + $s_length");
    //notifyListeners();
    return _orderSummary;
  }

}