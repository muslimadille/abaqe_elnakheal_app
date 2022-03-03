import 'dart:convert';

import 'package:abaqe_elnakheal_app/dio/models/product_photo_model.dart';
ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));
String productModelToJson(ProductModel data) => json.encode(data.toJson());
class ProductModel {
  ProductModel({
      this.id, 
      this.title, 
      this.description, 
      this.price, 
      this.offerPrice, 
      this.discountPercentage, 
      this.hasOffer, 
      this.nitrates, 
      this.categoryId, 
      this.quantity, 
      this.minQuantity, 
      this.cartCount, 
      this.rateCount, 
      this.photo, 
      this.thumb, 
      this.photos,});

  ProductModel.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    offerPrice = json['offer_price'];
    discountPercentage = json['discount_percentage'];
    hasOffer = json['has_offer'];
    nitrates = json['nitrates'];
    categoryId = json['category_id'];
    quantity = json['quantity'];
    minQuantity = json['min_quantity'];
    cartCount = json['cart_count'];
    rateCount = json['rate_count'];
    photo = json['photo'];
    thumb = json['thumb'];
    if (json['photos'] != null) {
      photos = [];
      json['photos'].forEach((v) {
        photos?.add(ProductPhotoModel.fromJson(v));
      });
    }
  }
  int? id;
  String? title;
  String? description;
  String? price;
  dynamic offerPrice;
  String? discountPercentage;
  String? hasOffer;
  String? nitrates;
  String? categoryId;
  String? quantity;
  dynamic minQuantity;
  String? cartCount;
  int? rateCount;
  String? photo;
  String? thumb;
  List<ProductPhotoModel>? photos;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['description'] = description;
    map['price'] = price;
    map['offer_price'] = offerPrice;
    map['discount_percentage'] = discountPercentage;
    map['has_offer'] = hasOffer;
    map['nitrates'] = nitrates;
    map['category_id'] = categoryId;
    map['quantity'] = quantity;
    map['min_quantity'] = minQuantity;
    map['cart_count'] = cartCount;
    map['rate_count'] = rateCount;
    map['photo'] = photo;
    map['thumb'] = thumb;
    if (photos != null) {
      map['photos'] = photos?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}