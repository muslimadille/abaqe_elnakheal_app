import 'address_model.dart';

class MyCartModel {
  List<Items>? items;
  List<AddressModel>? userAddresses;
  int? deliveryPrice;
  List<String>? messages;

  MyCartModel(
      {this.items, this.userAddresses, this.deliveryPrice, this.messages});

  MyCartModel.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    if (json['user_addresses'] != null) {
      userAddresses = <AddressModel>[];
      json['user_addresses'].forEach((v) {
        userAddresses!.add( AddressModel.fromJson(v));
      });
    }
    deliveryPrice = json['delivery_price'];
    if (json['messages'] != null) {
      messages = <String>[];
      json['messages'].forEach((v) {
        messages!.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    if (this.userAddresses != null) {
      data['user_addresses'] =
          this.userAddresses!.map((v) => v.toJson()).toList();
    }
    data['delivery_price'] = this.deliveryPrice;
    if (this.messages != null) {
      data['messages'] = this.messages!.map((v) => v).toList();
    }
    return data;
  }
}

class Items {
  int? id;
  int? quantity;
  int? itemId;
  String? title;
  int? minQuantity;
  int? productQuantity;
  String? price;
  String? offerPrice;
  int? discountPercentage;
  String? photo;

  Items(
      {this.id,
        this.quantity,
        this.itemId,
        this.title,
        this.minQuantity,
        this.productQuantity,
        this.price,
        this.offerPrice,
        this.discountPercentage,
        this.photo});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    itemId = json['item_id'];
    title = json['title'];
    minQuantity = json['min_quantity'];
    productQuantity = json['product_quantity'];
    price = json['price'];
    offerPrice = json['offer_price'];
    discountPercentage = json['discount_percentage'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['quantity'] = this.quantity;
    data['item_id'] = this.itemId;
    data['title'] = this.title;
    data['min_quantity'] = this.minQuantity;
    data['product_quantity'] = this.productQuantity;
    data['price'] = this.price;
    data['offer_price'] = this.offerPrice;
    data['discount_percentage'] = this.discountPercentage;
    data['photo'] = this.photo;
    return data;
  }
}