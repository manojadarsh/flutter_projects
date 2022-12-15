// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  Product({
    this.id,
    this.sno,
    this.currency,
    this.productName,
    this.rating,
    this.imageUrl,
    this.stock,
    this.orderStock,
    this.category,
    this.productDescription,
    this.price,
    this.store,
  });

  int id;
  int sno;
  Currency currency;
  String productName;
  int rating;
  String imageUrl;
  int stock;
  int orderStock;
  Category category;
  String productDescription;
  double price;
  Store store;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    sno: json["sno"],
    currency: currencyValues.map[json["currency"]],
    productName: json["product_name"],
    rating: json["rating"],
    imageUrl: json["image_url"],
    stock: json["stock"],
    orderStock: json["order_stock"],
    category: categoryValues.map[json["category"]],
    productDescription: json["product_description"],
    price: json["price"].toDouble(),
    store: storeValues.map[json["store"]],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "sno": sno,
    "currency": currencyValues.reverse[currency],
    "product_name": productName,
    "rating": rating,
    "image_url": imageUrl,
    "stock": stock,
    "order_stock": orderStock,
    "category": categoryValues.reverse[category],
    "product_description": productDescription,
    "price": price,
    "store": storeValues.reverse[store],
  };
}

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

enum Currency { EUR }

final currencyValues = EnumValues({
  "EUR": Currency.EUR
});

enum Store { TESCO }

final storeValues = EnumValues({
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
