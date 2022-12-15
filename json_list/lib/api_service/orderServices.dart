import 'package:http/http.dart' as http;
import 'package:json_list/models/order.dart';

class orderServices {
  static const String orderURL = 'http://shopfreshlii.a3jm.com:8043/freshlii/api/store/v1/orders';

  static Future<List<Order>> getOrders() async {
    try {
      final response = await http.get(orderURL);
      if (response.statusCode == 200) {
        final List<Order> orders = orderFromJson(response.body);
        return orders;
      } else {
        return List<Order>();
      }
    } catch (e) {
      return List<Order>();
    }
  }
}
