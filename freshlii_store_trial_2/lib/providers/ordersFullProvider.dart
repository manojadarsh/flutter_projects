import 'package:flutter/material.dart';
import 'package:freshlii_store_trial_2/models/orders_full.dart';
import 'package:http/http.dart' as http;



class OrdersFullProvider with ChangeNotifier {

  ResponseElement _bucketToday;
  ResponseElement _bucketTomorrow;
  ResponseElement _bucketWeek;

  Future<OrdersFull> getOrdersFull(String storeID, String appID, String companyID, String brandID) async {
    final queryParameters = {
      "store_id": storeID, 
      "app_id" : appID,
      "company_id" : companyID,
      "brand_id" : brandID,
      "level" : "full"
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
        final OrdersFull orderFull = ordersFullFromJson(response.body);
        //print(orders);
        _orderFull = orderFull;
        final initOrder = _orderFull.data.response.response.response.response;
        for(int x = 0; x < initOrder.length; x++) {
          if(initOrder[x].bucket == 0){
            _bucketToday = initOrder[x];
          } else if (initOrder[x].bucket == 4) {
            _bucketTomorrow = initOrder[x];
            print("tomorrow: ${_bucketTomorrow.endDate}");
          } else if (initOrder[x].bucket == 5) {
            _bucketWeek = initOrder[x];
            print("week: ${_bucketWeek.endDate}");
            print("week: ${_bucketWeek.orderInfo.orders.length}");
          }
          print("no match");
        }
        //print(_orderFull.message);
        notifyListeners();
        //return stores;

      } else {
        print("error1");
        return OrdersFull();
      }
    } catch (e) {
      print(e.toString());
      return OrdersFull();
    }
    //notifyListeners();
    print(_orderFull);
  }


  ResponseElement get bucketToday => _bucketToday;
  ResponseElement get bucketTomorrow => _bucketTomorrow;
  ResponseElement get bucketWeek => _bucketWeek;

  OrdersFull _orderFull = OrdersFull();

  OrdersFull orderFull1 (String storeID, String appID, String companyID, String brandID){

    getOrdersFull(storeID, appID, companyID, brandID);

    //print("cpp; + $s_length");
    //notifyListeners();
    return _orderFull;
  }

  OrdersFull get orderFull{


    //print("cpp; + $s_length");
    //notifyListeners();
    return _orderFull;
  }

}