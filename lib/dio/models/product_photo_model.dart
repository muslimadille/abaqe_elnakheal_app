import 'dart:convert';
ProductPhotoModel productPhotoModelFromJson(String str) => ProductPhotoModel.fromJson(json.decode(str));
String productPhotoModelToJson(ProductPhotoModel data) => json.encode(data.toJson());
class ProductPhotoModel {
  ProductPhotoModel({
      this.id, 
      this.productId, 
      this.photo,});

  ProductPhotoModel.fromJson(dynamic json) {
    id = json['id'];
    productId = json['product_id'];
    photo = json['photo'];
  }
  int? id;
  String? productId;
  String? photo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['product_id'] = productId;
    map['photo'] = photo;
    return map;
  }

}