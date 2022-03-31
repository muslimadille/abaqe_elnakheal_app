class ProductRatesModel {
  int? currentPage;
  List<RateData>? data;
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

  ProductRatesModel(
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

  ProductRatesModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <RateData>[];
      json['data'].forEach((v) {
        data!.add(new RateData.fromJson(v));
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

class RateData {
  int? id;
  int? userId;
  int? itemId;
  int? orderId;
  int? rate;
  String? createdAt;
  String? updatedAt;
  String? username;
  String? lastName;
  String? photo;

  RateData(
      {this.id,
        this.userId,
        this.itemId,
        this.orderId,
        this.rate,
        this.createdAt,
        this.updatedAt,
        this.username,
        this.lastName,
        this.photo});

  RateData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    itemId = json['item_id'];
    orderId = json['order_id'];
    rate = json['rate'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    username = json['username'];
    lastName = json['last_name'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['item_id'] = this.itemId;
    data['order_id'] = this.orderId;
    data['rate'] = this.rate;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['username'] = this.username;
    data['last_name'] = this.lastName;
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