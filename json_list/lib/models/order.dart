// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Order> orderFromJson(String str) => List<Order>.from(json.decode(str).map((x) => Order.fromJson(x)));

String orderToJson(List<Order> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Order {
  Order({
    this.id,
    this.currency,
    this.productName,
    this.productDescription,
    this.price,
    this.store,
    this.orderLineNo,
    this.qty,
    this.orderNo,
    this.discount,
    this.actPrice,
  });

  int id;
  Currency currency;
  String productName;
  String productDescription;
  double price;
  Store store;
  int orderLineNo;
  int qty;
  int orderNo;
  double discount;
  double actPrice;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    id: json["id"],
    currency: currencyValues.map[json["currency"]],
    productName: json["product_name"],
    productDescription: json["product_description"],
    price: json["price"].toDouble(),
    store: storeValues.map[json["store"]],
    orderLineNo: json["order_line_no"],
    qty: json["qty"],
    orderNo: json["order_no"],
    discount: json["discount"].toDouble(),
    actPrice: json["act_price"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "currency": currencyValues.reverse[currency],
    "product_name": productName,
    "product_description": productDescription,
    "price": price,
    "store": storeValues.reverse[store],
    "order_line_no": orderLineNo,
    "qty": qty,
    "order_no": orderNo,
    "discount": discount,
    "act_price": actPrice,
  };
}

enum Currency { EUR, EMPTY, A, HI, AB }

final currencyValues = EnumValues({
  "a": Currency.A,
  "ab": Currency.AB,
  "": Currency.EMPTY,
  "EUR": Currency.EUR,
  "HI": Currency.HI
});

enum Store { TESCO, EMPTY, ABCDE, HIIII }

final storeValues = EnumValues({
  "abcde": Store.ABCDE,
  "": Store.EMPTY,
  "HIIII": Store.HIIII,
  "Tesco": Store.TESCO
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
