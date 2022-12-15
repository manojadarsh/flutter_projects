import 'package:http/http.dart' as http;
import 'package:json_list/models/product.dart';

class productServices {
  static const String productURL = 'http://shopfreshlii.a3jm.com:8043/freshlii/api/store/v1/productStocks';

  static Future<List<Product>> getProducts() async {
    try {
      final response = await http.get(productURL);
      if (response.statusCode == 200) {
        final List<Product> products = productFromJson(response.body);
        return products;
      } else {
        return List<Product>();
      }
    } catch (e) {
      return List<Product>();
    }
  }
}
