import 'order_status_model.dart';

class MyOrdersModel {
  Orders? orders;
  List<OrderStatusModel>? statues;

  MyOrdersModel({this.orders, this.statues});

  MyOrdersModel.fromJson(Map<String, dynamic> json) {
    orders =
    json['orders'] != null ? new Orders.fromJson(json['orders']) : null;
    if (json['statues'] != null) {
      statues = <OrderStatusModel>[];
      json['statues'].forEach((v) {
        statues!.add(new OrderStatusModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.orders != null) {
      data['orders'] = this.orders!.toJson();
    }
    if (this.statues != null) {
      data['statues'] = this.statues!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Orders {
  int? currentPage;
  List<OrderData>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  Orders(
      {this.currentPage,
        this.data,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.links,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.prevPageUrl,
        this.to,
        this.total});

  Orders.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <OrderData>[];
      json['data'].forEach((v) {
        data!.add(new OrderData.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class OrderData {
  int? id;
  int? finalPrice;
  int? orderPrice;
  int? cobonDiscount;
  String? cobon;
  int? addressId;
  int? status;
  StatusText? statusText;
  String? addressName;
  String? addressDesc;
  String? notes;
  Address? address;
  int? canCancel;
  String? createdAt;
  int? ifRated;
  List<CartItems>? cartItems;

  OrderData(
      {this.id,
        this.finalPrice,
        this.orderPrice,
        this.cobonDiscount,
        this.cobon,
        this.addressId,
        this.status,
        this.statusText,
        this.addressName,
        this.addressDesc,
        this.notes,
        this.address,
        this.canCancel,
        this.createdAt,
        this.ifRated,
        this.cartItems});

  OrderData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    finalPrice = json['final_price'];
    orderPrice = json['order_price'];
    cobonDiscount = json['cobon_discount'];
    cobon = json['cobon'];
    addressId = json['address_id'];
    status = json['status'];
    statusText = json['status_text'] != null
        ? new StatusText.fromJson(json['status_text'])
        : null;
    addressName = json['address_name'];
    addressDesc = json['address_desc'];
    notes = json['notes'];
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
    canCancel = json['can_cancel'];
    createdAt = json['created_at'];
    ifRated = json['if_rated'];
    if (json['cart_items'] != null) {
      cartItems = <CartItems>[];
      json['cart_items'].forEach((v) {
        cartItems!.add(new CartItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['final_price'] = this.finalPrice;
    data['order_price'] = this.orderPrice;
    data['cobon_discount'] = this.cobonDiscount;
    data['cobon'] = this.cobon;
    data['address_id'] = this.addressId;
    data['status'] = this.status;
    if (this.statusText != null) {
      data['status_text'] = this.statusText!.toJson();
    }
    data['address_name'] = this.addressName;
    data['address_desc'] = this.addressDesc;
    data['notes'] = this.notes;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['can_cancel'] = this.canCancel;
    data['created_at'] = this.createdAt;
    data['if_rated'] = this.ifRated;
    if (this.cartItems != null) {
      data['cart_items'] = this.cartItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StatusText {
  int? id;
  String? name;

  StatusText({this.id, this.name});

  StatusText.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Address {
  int? id;
  String? name;
  String? address;
  int? userId;
  int? isHome;
  int? regionId;
  int? stateId;
  String? email;
  String? notes;
  int? isArchived;
  String? createdAt;
  String? updatedAt;

  Address(
      {this.id,
        this.name,
        this.address,
        this.userId,
        this.isHome,
        this.regionId,
        this.stateId,
        this.email,
        this.notes,
        this.isArchived,
        this.createdAt,
        this.updatedAt});

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    userId = json['user_id'];
    isHome = json['is_home'];
    regionId = json['region_id'];
    stateId = json['state_id'];
    email = json['email'];
    notes = json['notes'];
    isArchived = json['is_archived'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['user_id'] = this.userId;
    data['is_home'] = this.isHome;
    data['region_id'] = this.regionId;
    data['state_id'] = this.stateId;
    data['email'] = this.email;
    data['notes'] = this.notes;
    data['is_archived'] = this.isArchived;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class CartItems {
  int? id;
  int? itemId;
  int? quantity;
  int? orderId;
  String? title;
  String? photo;

  CartItems(
      {this.id,
        this.itemId,
        this.quantity,
        this.orderId,
        this.title,
        this.photo});

  CartItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    itemId = json['item_id'];
    quantity = json['quantity'];
    orderId = json['order_id'];
    title = json['title'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['item_id'] = this.itemId;
    data['quantity'] = this.quantity;
    data['order_id'] = this.orderId;
    data['title'] = this.title;
    data['photo'] = this.photo;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['label'] = this.label;
    data['active'] = this.active;
    return data;
  }
}