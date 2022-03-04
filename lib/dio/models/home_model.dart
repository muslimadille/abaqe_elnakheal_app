import 'dart:convert';

import 'home_category_model.dart';
import 'home_slider_model.dart';
HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));
String homeModelToJson(HomeModel data) => json.encode(data.toJson());
class HomeModel {
  HomeModel({
      this.cartCount, 
      this.slider, 
      this.categories,});

  HomeModel.fromJson(dynamic json) {
    cartCount = json['cart_count'];
    if (json['slider'] != null) {
      slider = [];
      json['slider'].forEach((v) {
        slider?.add(HomeSliderModel.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = [];
      json['categories'].forEach((v) {
        categories?.add(HomeCategoryModel.fromJson(v));
      });
    }
  }
  int? cartCount;
  List<HomeSliderModel>? slider;
  List<HomeCategoryModel>? categories;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cart_count'] = cartCount;
    if (slider != null) {
      map['slider'] = slider?.map((v) => v.toJson()).toList();
    }
    if (categories != null) {
      map['categories'] = categories?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}