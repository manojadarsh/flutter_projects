// To parse this JSON data, do
//
//     final ordersFull = ordersFullFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/cupertino.dart';

OrdersFull ordersFullFromJson(String str) => OrdersFull.fromJson(json.decode(str));

String ordersFullToJson(OrdersFull data) => json.encode(data.toJson());

class OrdersFull {
  OrdersFull({
    this.message,
    this.data,
  });

  String message;
  Data data;

  factory OrdersFull.fromJson(Map<String, dynamic> json) => OrdersFull(
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
    this.response,
    this.received,
  });

  DataResponse response;
  Received received;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    response: DataResponse.fromJson(json["response"]),
    received: Received.fromJson(json["received"]),
  );

  Map<String, dynamic> toJson() => {
    "response": response.toJson(),
    "received": received.toJson(),
  };
}

class Received {
  Received({
    this.storeId,
    this.appId,
    this.companyId,
    this.brandId,
    this.level,
  });

  String storeId;
  String appId;
  String companyId;
  String brandId;
  String level;

  factory Received.fromJson(Map<String, dynamic> json) => Received(
    storeId: json["store_id"],
    appId: json["app_id"],
    companyId: json["company_id"],
    brandId: json["brand_id"],
    level: json["level"],
  );

  Map<String, dynamic> toJson() => {
    "store_id": storeId,
    "app_id": appId,
    "company_id": companyId,
    "brand_id": brandId,
    "level": level,
  };
}

class DataResponse {
  DataResponse({
    this.response,
  });

  PurpleResponse response;

  factory DataResponse.fromJson(Map<String, dynamic> json) => DataResponse(
    response: PurpleResponse.fromJson(json["response"]),
  );

  Map<String, dynamic> toJson() => {
    "response": response.toJson(),
  };
}

class PurpleResponse {
  PurpleResponse({
    this.elapsed,
    this.response,
  });

  String elapsed;
  FluffyResponse response;

  factory PurpleResponse.fromJson(Map<String, dynamic> json) => PurpleResponse(
    elapsed: json["elapsed"],
    response: FluffyResponse.fromJson(json["response"]),
  );

  Map<String, dynamic> toJson() => {
    "elapsed": elapsed,
    "response": response.toJson(),
  };
}

class FluffyResponse {
  FluffyResponse({
    this.storeId,
    this.storeName,
    this.storeActive,
    this.currentDate,
    this.currentTime,
    this.response,
  });

  String storeId;
  String storeName;
  int storeActive;
  DateTime currentDate;
  DateTime currentTime;
  List<ResponseElement> response;

  factory FluffyResponse.fromJson(Map<String, dynamic> json) => FluffyResponse(
    storeId: json["storeId"],
    storeName: json["storeName"],
    storeActive: json["storeActive"],
    currentDate: DateTime.parse(json["currentDate"]),
    currentTime: DateTime.parse(json["currentTime"]),
    response: List<ResponseElement>.from(json["response"].map((x) => ResponseElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "storeId": storeId,
    "storeName": storeName,
    "storeActive": storeActive,
    "currentDate": "${currentDate.year.toString().padLeft(4, '0')}-${currentDate.month.toString().padLeft(2, '0')}-${currentDate.day.toString().padLeft(2, '0')}",
    "currentTime": currentTime.toIso8601String(),
    "response": List<dynamic>.from(response.map((x) => x.toJson())),
  };
}

class ResponseElement {
  ResponseElement({
    this.bucket,
    this.intervalText,
    this.intervalDays,
    this.startDate,
    this.endDate,
    this.orderCount,
    this.revenue,
    this.discount,
    this.actualSale,
    this.orderInfo,
  });

  int bucket;
  String intervalText;
  int intervalDays;
  DateTime startDate;
  DateTime endDate;
  int orderCount;
  double revenue;
  double discount;
  double actualSale;
  OrderInfo orderInfo;

  factory ResponseElement.fromJson(Map<String, dynamic> json) => ResponseElement(
    bucket: json["bucket"],
    intervalText: json["interval_text"],
    intervalDays: json["interval_days"],
    startDate: DateTime.parse(json["start_date"]),
    endDate: DateTime.parse(json["end_date"]),
    orderCount: json["order_count"],
    revenue: json["revenue"].toDouble(),
    discount: json["discount"].toDouble(),
    actualSale: json["actual_sale"].toDouble(),
    orderInfo: json["orderInfo"] == null ? null : OrderInfo.fromJson(json["orderInfo"]),
  );

  Map<String, dynamic> toJson() => {
    "bucket": bucket,
    "interval_text": intervalText,
    "interval_days": intervalDays,
    "start_date": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
    "end_date": "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
    "order_count": orderCount,
    "revenue": revenue,
    "discount": discount,
    "actual_sale": actualSale,
    "orderInfo": orderInfo == null ? null : orderInfo.toJson(),
  };
}

class OrderInfo {
  OrderInfo({
    this.summary,
    this.orders,
  });

  Summary summary;
  List<Order> orders;

  factory OrderInfo.fromJson(Map<String, dynamic> json) => OrderInfo(
    summary: Summary.fromJson(json["summary"]),
    orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "summary": summary.toJson(),
    "orders": List<dynamic>.from(orders.map((x) => x.toJson())),
  };
}

class Order with ChangeNotifier{
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
    orderPickupDate: DateTime.parse(json["order_pickup_date"]),
    orderDetails: OrderDetails.fromJson(json["orderDetails"]),
  );

  Map<String, dynamic> toJson() => {
    "customer_reference": customerReference,
    "store_reference": storeReference,
    "store_id": storeId,
    "order_id": orderId,
    "order_pickup_date": orderPickupDate.toIso8601String(),
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

class Item with ChangeNotifier {
  Item({
    this.productSku,
    this.productName,
    this.bookedQuantity,
    this.storePrice,
    this.storeDiscountPrice,
    this.orderedQuantity,
    this.amendedQuantity,
    this.orderedPrice,
    this.orderedDiscountPrice,
    this.imageUrl,
    this.charge,
    this.discountedCharge,
  });

  String productSku;
  String productName;
  int bookedQuantity;
  double storePrice;
  double storeDiscountPrice;
  int orderedQuantity;
  double amendedQuantity;
  int orderedPrice;
  int orderedDiscountPrice;
  String imageUrl;
  double charge;
  double discountedCharge;

  void setAmendedQuantity(double quantity) {
    if (quantity < bookedQuantity * 1.1 || quantity > bookedQuantity * 0.9 || quantity == 0){
      amendedQuantity = quantity;
      print(amendedQuantity);
    } else {
      print(quantity);
      print("must be with limits or 0");
    }
    notifyListeners();
  }

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    productSku: json["product_sku"],
    productName: json["product_name"],
    bookedQuantity: json["booked_quantity"],
    storePrice: json["store_price"].toDouble(),
    storeDiscountPrice: json["store_discount_price"].toDouble(),
    orderedQuantity: json["ordered_quantity"],
    orderedPrice: json["ordered_price"],
    orderedDiscountPrice: json["ordered_discount_price"],
    imageUrl: json["image_url"],
    charge: json["charge"].toDouble(),
    discountedCharge: json["discounted_charge"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "product_sku": productSku,
    "product_name": productName,
    "booked_quantity": bookedQuantity,
    "store_price": storePrice,
    "store_discount_price": storeDiscountPrice,
    "ordered_quantity": orderedQuantity,
    "ordered_price": orderedPrice,
    "ordered_discount_price": orderedDiscountPrice,
    "image_url": imageUrl,
    "charge": charge,
    "discounted_charge": discountedCharge,
  };
}

class Summary {
  Summary({
    this.charge,
    this.discountedCharge,
    this.count,
    this.numOrders,
  });

  double charge;
  double discountedCharge;
  int count;
  int numOrders;

  factory Summary.fromJson(Map<String, dynamic> json) => Summary(
    charge: json["charge"].toDouble(),
    discountedCharge: json["discounted_charge"].toDouble(),
    count: json["count"],
    numOrders: json["numOrders"] == null ? null : json["numOrders"],
  );

  Map<String, dynamic> toJson() => {
    "charge": charge,
    "discounted_charge": discountedCharge,
    "count": count,
    "numOrders": numOrders == null ? null : numOrders,
  };
}
