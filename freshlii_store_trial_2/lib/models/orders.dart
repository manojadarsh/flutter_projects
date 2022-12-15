// To parse this JSON data, do
//
//     final orders = ordersFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';

Orders ordersFromJson(String str) => Orders.fromJson(json.decode(str));

String ordersToJson(Orders data) => json.encode(data.toJson());

class Orders with ChangeNotifier{
  Orders({
    this.message,
    this.data,
  });

  String message;
  Data data;

  factory Orders.fromJson(Map<String, dynamic> json) => Orders(
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.storeOrders,
    this.received,
  });

  StoreOrders storeOrders;
  Received received;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    storeOrders: StoreOrders.fromJson(json["storeOrders"]),
    received: Received.fromJson(json["received"]),
  );

  Map<String, dynamic> toJson() => {
    "storeOrders": storeOrders.toJson(),
    "received": received.toJson(),
  };
}

class Received {
  Received({
    this.storeId,
  });

  String storeId;

  factory Received.fromJson(Map<String, dynamic> json) => Received(
    storeId: json["store_id"],
  );

  Map<String, dynamic> toJson() => {
    "store_id": storeId,
  };
}

class StoreOrders {
  StoreOrders({
    this.elapsed,
    this.request,
    this.response,
  });

  String elapsed;
  Received request;
  Response response;

  factory StoreOrders.fromJson(Map<String, dynamic> json) => StoreOrders(
    elapsed: json["elapsed"],
    request: Received.fromJson(json["request"]),
    response: Response.fromJson(json["response"]),
  );

  Map<String, dynamic> toJson() => {
    "elapsed": elapsed,
    "request": request.toJson(),
    "response": response.toJson(),
  };
}

class Response {
  Response({
    this.summary,
    this.orders,
  });

  Summary summary;
  List<Order> orders;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    summary: Summary.fromJson(json["summary"]),
    orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "summary": summary.toJson(),
    "orders": List<dynamic>.from(orders.map((x) => x.toJson())),
  };
}

class Order with ChangeNotifier {
  Order({
    this.customerReference,
    this.storeReference,
    this.storeId,
    this.orderId,
    this.orderPickupDate,
    this.orderDetails,
  });

  String customerReference;
  String storeReference;
  int storeId;
  int orderId;
  DateTime orderPickupDate;
  OrderDetails orderDetails;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    customerReference: json["customer_reference"],
    storeReference: json["store_reference"],
    storeId: json["store_id"],
    orderId: json["order_id"],
    orderPickupDate: json["order_pickup_date"] == null ? null : DateTime.parse(json["order_pickup_date"]),
    orderDetails: OrderDetails.fromJson(json["orderDetails"]),
  );

  Map<String, dynamic> toJson() => {
    "customer_reference": customerReference,
    "store_reference": storeReference,
    "store_id": storeId,
    "order_id": orderId,
    "order_pickup_date": orderPickupDate == null ? null : orderPickupDate.toIso8601String(),
    "orderDetails": orderDetails.toJson(),
  };
}

class OrderDetails {
  OrderDetails({
    this.summary,
    this.items,
  });

  Summary summary;
  List<Item> items;

  factory OrderDetails.fromJson(Map<String, dynamic> json) => OrderDetails(
    summary: Summary.fromJson(json["summary"]),
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "summary": summary.toJson(),
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
  };
}

class Item with ChangeNotifier{
  Item({
    this.productSku,
    this.productName,
    this.bookedQuantity,
    this.storePrice,
    this.storeDiscountPrice,
    this.orderedPrice,
    this.orderedDiscountPrice,
    this.cost,
    this.discountedCost,
  });

  String productSku;
  String productName;
  int bookedQuantity;
  double storePrice;
  double storeDiscountPrice;
  int orderedPrice;
  int orderedDiscountPrice;
  double cost;
  double discountedCost;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    productSku: json["product_sku"],
    productName: json["product_name"],
    bookedQuantity: json["booked_quantity"],
    storePrice: json["store_price"].toDouble(),
    storeDiscountPrice: json["store_discount_price"].toDouble(),
    orderedPrice: json["ordered_price"],
    orderedDiscountPrice: json["ordered_discount_price"],
    cost: json["cost"].toDouble(),
    discountedCost: json["discounted_cost"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "product_sku": productSku,
    "product_name": productName,
    "booked_quantity": bookedQuantity,
    "store_price": storePrice,
    "store_discount_price": storeDiscountPrice,
    "ordered_price": orderedPrice,
    "ordered_discount_price": orderedDiscountPrice,
    "cost": cost,
    "discounted_cost": discountedCost,
  };
}

class Summary {
  Summary({
    this.cost,
    this.discountedCost,
    this.count,
    this.numOrders,
  });

  double cost;
  double discountedCost;
  int count;
  int numOrders;

  factory Summary.fromJson(Map<String, dynamic> json) => Summary(
    cost: json["cost"].toDouble(),
    discountedCost: json["discounted_cost"].toDouble(),
    count: json["count"],
    numOrders: json["numOrders"] == null ? null : json["numOrders"],
  );

  Map<String, dynamic> toJson() => {
    "cost": cost,
    "discounted_cost": discountedCost,
    "count": count,
    "numOrders": numOrders == null ? null : numOrders,
  };
}
