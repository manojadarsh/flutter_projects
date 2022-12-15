// To parse this JSON data, do
//
//     final store = storeFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/cupertino.dart';

List<Store> storeFromJson(String str) => List<Store>.from(json.decode(str).map((x) => Store.fromJson(x)));

String storeToJson(List<Store> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Store with ChangeNotifier{
  Store({
    this.appId,
    this.appName,
    this.whiteLabel,
    this.appLogo1,
    this.appLogo2,
    this.appOwnerId,
    this.appOwnerName,
    this.appDescription,
    this.instanceId,
    this.instanceName,
    this.instanceSubZone,
    this.instanceSubZoneName,
    this.storeId,
    this.storeName,
    this.storeActive,
    this.rating,
    this.storeResumeHours,
    this.storeLastActiveHours,
    this.dateCreated,
    this.dateActivated,
    this.dateSuspended,
    this.dateUpdated,
    this.imageUrl,
    this.imageLogoSmall,
    this.imageLogoBig,
    this.imagePromo1,
    this.imagePromo2,
    this.imagePromo3,
    this.storeCategoryId,
    this.storeCategoryName,
    this.brandName,
    this.companyName,
    this.isFavorite
  });

  int appId;
  String appName;
  int whiteLabel;
  String appLogo1;
  String appLogo2;
  int appOwnerId;
  String appOwnerName;
  String appDescription;
  int instanceId;
  String instanceName;
  String instanceSubZone;
  String instanceSubZoneName;
  int storeId;
  String storeName;
  int storeActive;
  double rating;
  DateTime storeResumeHours;
  DateTime storeLastActiveHours;
  DateTime dateCreated;
  DateTime dateActivated;
  dynamic dateSuspended;
  DateTime dateUpdated;
  String imageUrl;
  String imageLogoSmall;
  String imageLogoBig;
  String imagePromo1;
  String imagePromo2;
  String imagePromo3;
  int storeCategoryId;
  String storeCategoryName;
  String brandName;
  String companyName;
  int isFavorite;

  factory Store.fromJson(Map<String, dynamic> json) => Store(
    appId: json["app_id"],
    appName: json["app_name"],
    whiteLabel: json["white_label"],
    appLogo1: json["app_logo_1"],
    appLogo2: json["app_logo_2"],
    appOwnerId: json["app_owner_id"],
    appOwnerName: json["app_owner_name"],
    appDescription: json["app_description"],
    instanceId: json["instance_id"],
    instanceName: json["instance_name"],
    instanceSubZone: json["instance_sub_zone"],
    instanceSubZoneName: json["instance_sub_zone_name"],
    storeId: json["store_id"],
    storeName: json["store_name"],
    storeActive: json["store_active"],
    rating: json["rating"].toDouble(),
    storeResumeHours: DateTime.parse(json["store_resume_hours"]),
    storeLastActiveHours: DateTime.parse(json["store_last_active_hours"]),
    dateCreated: DateTime.parse(json["date_created"]),
    dateActivated: DateTime.parse(json["date_activated"]),
    dateSuspended: json["date_suspended"],
    dateUpdated: DateTime.parse(json["date_updated"]),
    imageUrl: json["image_url"],
    imageLogoSmall: json["image_logo_small"],
    imageLogoBig: json["image_logo_big"],
    imagePromo1: json["image_promo_1"],
    imagePromo2: json["image_promo_2"],
    imagePromo3: json["image_promo_3"],
    storeCategoryId: json["store_category_id"],
    storeCategoryName: json["store_category_name"],
    brandName: json["brand_name"],
    companyName: json["company_name"],
  );

  Map<String, dynamic> toJson() => {
    "app_id": appId,
    "app_name": appName,
    "white_label": whiteLabel,
    "app_logo_1": appLogo1,
    "app_logo_2": appLogo2,
    "app_owner_id": appOwnerId,
    "app_owner_name": appOwnerName,
    "app_description": appDescription,
    "instance_id": instanceId,
    "instance_name": instanceName,
    "instance_sub_zone": instanceSubZone,
    "instance_sub_zone_name": instanceSubZoneName,
    "store_id": storeId,
    "store_name": storeName,
    "store_active": storeActive,
    "rating": rating,
    "store_resume_hours": storeResumeHours.toIso8601String(),
    "store_last_active_hours": storeLastActiveHours.toIso8601String(),
    "date_created": dateCreated.toIso8601String(),
    "date_activated": dateActivated.toIso8601String(),
    "date_suspended": dateSuspended,
    "date_updated": dateUpdated.toIso8601String(),
    "image_url": imageUrl,
    "image_logo_small": imageLogoSmall,
    "image_logo_big": imageLogoBig,
    "image_promo_1": imagePromo1,
    "image_promo_2": imagePromo2,
    "image_promo_3": imagePromo3,
    "store_category_id": storeCategoryId,
    "store_category_name": storeCategoryName,
    "brand_name": brandName,
    "company_name": companyName,
  };

  void toggleFavoriteStatus() {
    isFavorite += 1;
    notifyListeners();
  }

  bool favorite() {
    if (isFavorite.remainder(2) != 0)
      return true;
    else
      return false;
  }
}