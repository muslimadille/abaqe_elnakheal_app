import 'dart:convert';
HomeSliderModel homeSliderModelFromJson(String str) => HomeSliderModel.fromJson(json.decode(str));
String homeSliderModelToJson(HomeSliderModel data) => json.encode(data.toJson());
class HomeSliderModel {
  HomeSliderModel({
      this.title, 
      this.description, 
      this.buttonTitle, 
      this.itemType, 
      this.itemId, 
      this.item,});

  HomeSliderModel.fromJson(dynamic json) {
    title = json['title'];
    description = json['description'];
    buttonTitle = json['button_title'];
    itemType = json['item_type'];
    itemId = json['item_id'];
    item = json['item'] != null ? Item.fromJson(json['item']) : null;
  }
  String? title;
  String? description;
  String? buttonTitle;
  String? itemType;
  String? itemId;
  Item? item;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['description'] = description;
    map['button_title'] = buttonTitle;
    map['item_type'] = itemType;
    map['item_id'] = itemId;
    if (item != null) {
      map['item'] = item?.toJson();
    }
    return map;
  }

}

Item itemFromJson(String str) => Item.fromJson(json.decode(str));
String itemToJson(Item data) => json.encode(data.toJson());
class Item {
  Item({
      this.id, 
      this.categoryType, 
      this.name, 
      this.nameEn, 
      this.photo, 
      this.thumb, 
      this.sort, 
      this.parentId, 
      this.isShop, 
      this.stop, 
      this.isArchived, 
      this.createdAt, 
      this.updatedAt, 
      this.color,});

  Item.fromJson(dynamic json) {
    id = json['id'];
    categoryType = json['category_type'];
    name = json['name'];
    nameEn = json['name_en'];
    photo = json['photo'];
    thumb = json['thumb'];
    sort = json['sort'];
    parentId = json['parent_id'];
    isShop = json['is_shop'];
    stop = json['stop'];
    isArchived = json['is_archived'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    color = json['color'];
  }
  int? id;
  String? categoryType;
  String? name;
  String? nameEn;
  String? photo;
  String? thumb;
  String? sort;
  String? parentId;
  String? isShop;
  String? stop;
  String? isArchived;
  String? createdAt;
  String? updatedAt;
  String? color;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['category_type'] = categoryType;
    map['name'] = name;
    map['name_en'] = nameEn;
    map['photo'] = photo;
    map['thumb'] = thumb;
    map['sort'] = sort;
    map['parent_id'] = parentId;
    map['is_shop'] = isShop;
    map['stop'] = stop;
    map['is_archived'] = isArchived;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['color'] = color;
    return map;
  }

}