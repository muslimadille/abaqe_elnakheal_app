import 'dart:convert';

import 'package:abaqe_elnakheal_app/dio/models/product_model.dart';
HomeCategoryModel homeCategoryModelFromJson(String str) => HomeCategoryModel.fromJson(json.decode(str));
String homeCategoryModelToJson(HomeCategoryModel data) => json.encode(data.toJson());
class HomeCategoryModel {
  HomeCategoryModel({
      this.id, 
      this.name, 
      this.photo, 
      this.thumb, 
      this.products,});

  HomeCategoryModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    photo = json['photo'];
    thumb = json['thumb'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(ProductModel.fromJson(v));
      });
    }
  }
  int? id;
  String? name;
  String? photo;
  String? thumb;
  List<ProductModel>? products;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['photo'] = photo;
    map['thumb'] = thumb;
    if (products != null) {
      map['products'] = products?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}