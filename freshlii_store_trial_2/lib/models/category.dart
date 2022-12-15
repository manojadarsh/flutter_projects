// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

List<Category> categoryFromJson(String str) => List<Category>.from(json.decode(str).map((x) => Category.fromJson(x)));

String categoryToJson(List<Category> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Category {
  Category({
    this.id,
    this.appId,
    this.instanceId,
    this.versionNo,
    this.storeCategoryId,
    this.storeCategoryName,
    this.imageUrl,
    this.dateCreated,
    this.dateActivated,
    this.dateSuspended,
    this.dateUpdated,
  });

  int id;
  int appId;
  int instanceId;
  int versionNo;
  int storeCategoryId;
  String storeCategoryName;
  String imageUrl;
  DateTime dateCreated;
  DateTime dateActivated;
  dynamic dateSuspended;
  DateTime dateUpdated;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    appId: json["app_id"],
    instanceId: json["instance_id"],
    versionNo: json["version_no"],
    storeCategoryId: json["store_category_id"],
    storeCategoryName: json["store_category_name"],
    imageUrl: json["image_url"],
    dateCreated: DateTime.parse(json["date_created"]),
    dateActivated: DateTime.parse(json["date_activated"]),
    dateSuspended: json["date_suspended"],
    dateUpdated: DateTime.parse(json["date_updated"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "app_id": appId,
    "instance_id": instanceId,
    "version_no": versionNo,
    "store_category_id": storeCategoryId,
    "store_category_name": storeCategoryName,
    "image_url": imageUrl,
    "date_created": dateCreated.toIso8601String(),
    "date_activated": dateActivated.toIso8601String(),
    "date_suspended": dateSuspended,
    "date_updated": dateUpdated.toIso8601String(),
  };
}