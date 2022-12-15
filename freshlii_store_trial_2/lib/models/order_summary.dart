// To parse this JSON data, do
//
//     final orderSummary = orderSummaryFromJson(jsonString);

import 'dart:convert';

OrderSummary orderSummaryFromJson(String str) => OrderSummary.fromJson(json.decode(str));

String orderSummaryToJson(OrderSummary data) => json.encode(data.toJson());

class OrderSummary {
  OrderSummary({
    this.message,
    this.data,
  });

  String message;
  Data data;

  factory OrderSummary.fromJson(Map<String, dynamic> json) => OrderSummary(
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
  };
}
