// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product with ChangeNotifier{
  Product({
    this.sno,
    this.currency,
    this.store,
    this.id,
    this.appId,
    this.instanceId,
    this.versionNo,
    this.storeId,
    this.productId,
    this.productName,
    this.productDescription,
    this.priceEffectiveDate,
    this.discountEffectiveDate,
    this.price,
    this.currencyId,
    this.desiredQuantity,
    this.stock,
    this.orderStock,
    this.rating,
    this.productCategoryId,
    this.imageUrl,
    this.dateCreated,
    this.dateActivated,
    this.dateSuspended,
    this.dateUpdated,
    this.storeName,
    this.storeActive,
    this.storeResumeHours,
    this.storeCategoryName,
    this.brandName,
    this.companyName,
    this.productCategoryName,
    this.category,
    this.odQuantity,
  });

  int sno;
  Currency currency;
  Stores store;
  int id;
  int appId;
  int instanceId;
  int versionNo;
  int storeId;
  int productId;
  String productName;
  String productDescription;
  DateTime priceEffectiveDate;
  DateTime discountEffectiveDate;
  double price;
  int currencyId;
  int desiredQuantity;
  int stock;
  int orderStock;
  int rating;
  int productCategoryId;
  String imageUrl;
  DateTime dateCreated;
  DateTime dateActivated;
  dynamic dateSuspended;
  DateTime dateUpdated;
  Stores storeName;
  int storeActive;
  DateTime storeResumeHours;
  StoreCategoryName storeCategoryName;
  BrandName brandName;
  CompanyName companyName;
  Category productCategoryName;
  Category category;
  int odQuantity;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    sno: json["sno"],
    currency: currencyValues.map[json["currency"]],
    store: storeValues.map[json["store"]],
    id: json["id"],
    appId: json["app_id"],
    instanceId: json["instance_id"],
    versionNo: json["version_no"],
    storeId: json["store_id"],
    productId: json["product_id"],
    productName: json["product_name"],
    productDescription: json["product_description"],
    priceEffectiveDate: DateTime.parse(json["price_effective_date"]),
    discountEffectiveDate: DateTime.parse(json["discount_effective_date"]),
    price: json["price"].toDouble(),
    currencyId: json["currency_id"],
    stock: json["stock"],
    orderStock: json["order_stock"],
    rating: json["rating"],
    productCategoryId: json["product_category_id"],
    imageUrl: json["image_url"],
    dateCreated: DateTime.parse(json["date_created"]),
    dateActivated: DateTime.parse(json["date_activated"]),
    dateSuspended: json["date_suspended"],
    dateUpdated: DateTime.parse(json["date_updated"]),
    storeName: storeValues.map[json["store_name"]],
    storeActive: json["store_active"],
    storeResumeHours: DateTime.parse(json["store_resume_hours"]),
    storeCategoryName: storeCategoryNameValues.map[json["store_category_name"]],
    brandName: brandNameValues.map[json["brand_name"]],
    companyName: companyNameValues.map[json["company_name"]],
    productCategoryName: categoryValues.map[json["product_category_name"]],
    category: categoryValues.map[json["category"]],
  );

  Map<String, dynamic> toJson() => {
    "sno": sno,
    "currency": currencyValues.reverse[currency],
    "store": storeValues.reverse[store],
    "id": id,
    "app_id": appId,
    "instance_id": instanceId,
    "version_no": versionNo,
    "store_id": storeId,
    "product_id": productId,
    "product_name": productName,
    "product_description": productDescription,
    "price_effective_date": priceEffectiveDate.toIso8601String(),
    "discount_effective_date": discountEffectiveDate.toIso8601String(),
    "price": price,
    "currency_id": currencyId,
    "stock": stock,
    "order_stock": orderStock,
    "rating": rating,
    "product_category_id": productCategoryId,
    "image_url": imageUrl,
    "date_created": dateCreated.toIso8601String(),
    "date_activated": dateActivated.toIso8601String(),
    "date_suspended": dateSuspended,
    "date_updated": dateUpdated.toIso8601String(),
    "store_name": storeValues.reverse[storeName],
    "store_active": storeActive,
    "store_resume_hours": storeResumeHours.toIso8601String(),
    "store_category_name": storeCategoryNameValues.reverse[storeCategoryName],
    "brand_name": brandNameValues.reverse[brandName],
    "company_name": companyNameValues.reverse[companyName],
    "product_category_name": categoryValues.reverse[productCategoryName],
    "category": categoryValues.reverse[category],
  };


}

enum BrandName { VILLAGE_GROCER }

final brandNameValues = EnumValues({
  "Village Grocer": BrandName.VILLAGE_GROCER
});

enum Category { FRUITS_AND_VEGETABLES, MEAT_AND_SEAFOOD, MEAT_SEAFOOD_AND_POULTRY, DAIRY, DRY_AND_CANNED_FOODS, BEVERAGES, BAKERY }

final categoryValues = EnumValues({
  "Bakery": Category.BAKERY,
  "Beverages": Category.BEVERAGES,
  "Dairy": Category.DAIRY,
  "Dry and Canned Foods": Category.DRY_AND_CANNED_FOODS,
  "Fruits and Vegetables": Category.FRUITS_AND_VEGETABLES,
  "Meat and Seafood": Category.MEAT_AND_SEAFOOD,
  "Meat, Seafood, and Poultry": Category.MEAT_SEAFOOD_AND_POULTRY
});

enum CompanyName { ENDCELL }

final companyNameValues = EnumValues({
  "Endcell": CompanyName.ENDCELL
});

enum Currency { EUR }

final currencyValues = EnumValues({
  "EUR": Currency.EUR
});

enum Stores { DESA_P_ARK_CITY }

final storeValues = EnumValues({
  "DesaPArk City": Stores.DESA_P_ARK_CITY
});

enum StoreCategoryName { MEAT }

final storeCategoryNameValues = EnumValues({
  "Meat": StoreCategoryName.MEAT
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
