class AddOrderModel {
  Order? order;
  String? paymentUrl;

  AddOrderModel({this.order, this.paymentUrl});

  AddOrderModel.fromJson(Map<String, dynamic> json) {
    order = json['order'] != null ? new Order.fromJson(json['order']) : null;
    paymentUrl = json['payment_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.order != null) {
      data['order'] = this.order!.toJson();
    }
    data['payment_url'] = this.paymentUrl;
    return data;
  }
}

class Order {
  int? id;
  int? finalPrice;
  int? deliveryPrice;
  int? orderPrice;
  int? userId;
  String? addressId;
  int? paymentMethod;
  int? cartPaymentMethod;
  int? status;
  String? cobon;
  int? taxes;
  int? cobonDiscount;
  dynamic longitude;
  dynamic latitude;
  dynamic addressName;
  dynamic addressDesc;
  dynamic countryId;
  dynamic regionId;
  dynamic stateId;
  dynamic token;
  dynamic shortCode;
  dynamic acceptedBy;
  dynamic addedBy;
  dynamic reviewdBy;
  int? sentSms;
  dynamic marketedDate;
  dynamic financialDate;
  dynamic warehouseDate;
  String? createdAt;
  String? updatedAt;
  String? handDeliveryFees;
  dynamic referenceId;
  dynamic transactionId;
  String? nitratesImage;
  String? nationalId;
  String? nationalIdImage;
  String? notes;

  Order(
      {this.id,
        this.finalPrice,
        this.deliveryPrice,
        this.orderPrice,
        this.userId,
        this.addressId,
        this.paymentMethod,
        this.cartPaymentMethod,
        this.status,
        this.cobon,
        this.taxes,
        this.cobonDiscount,
        this.longitude,
        this.latitude,
        this.addressName,
        this.addressDesc,
        this.countryId,
        this.regionId,
        this.stateId,
        this.token,
        this.shortCode,
        this.acceptedBy,
        this.addedBy,
        this.reviewdBy,
        this.sentSms,
        this.marketedDate,
        this.financialDate,
        this.warehouseDate,
        this.createdAt,
        this.updatedAt,
        this.handDeliveryFees,
        this.referenceId,
        this.transactionId,
        this.nitratesImage,
        this.nationalId,
        this.nationalIdImage,
        this.notes});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    finalPrice = json['final_price'];
    deliveryPrice = json['delivery_price'];
    orderPrice = json['order_price'];
    userId = json['user_id'];
    addressId = json['address_id'];
    paymentMethod = json['payment_method'];
    cartPaymentMethod = json['cart_payment_method'];
    status = json['status'];
    cobon = json['cobon'];
    taxes = json['taxes'];
    cobonDiscount = json['cobon_discount'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    addressName = json['address_name'];
    addressDesc = json['address_desc'];
    countryId = json['country_id'];
    regionId = json['region_id'];
    stateId = json['state_id'];
    token = json['token'];
    shortCode = json['short_code'];
    acceptedBy = json['accepted_by'];
    addedBy = json['added_by'];
    reviewdBy = json['reviewd_by'];
    sentSms = json['sent_sms'];
    marketedDate = json['marketed_date'];
    financialDate = json['financial_date'];
    warehouseDate = json['warehouse_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    handDeliveryFees = json['hand_delivery_fees'];
    referenceId = json['reference_id'];
    transactionId = json['transaction_id'];
    nitratesImage = json['nitrates_image'];
    nationalId = json['national_id'];
    nationalIdImage = json['national_id_image'];
    notes = json['notes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['final_price'] = this.finalPrice;
    data['delivery_price'] = this.deliveryPrice;
    data['order_price'] = this.orderPrice;
    data['user_id'] = this.userId;
    data['address_id'] = this.addressId;
    data['payment_method'] = this.paymentMethod;
    data['cart_payment_method'] = this.cartPaymentMethod;
    data['status'] = this.status;
    data['cobon'] = this.cobon;
    data['taxes'] = this.taxes;
    data['cobon_discount'] = this.cobonDiscount;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['address_name'] = this.addressName;
    data['address_desc'] = this.addressDesc;
    data['country_id'] = this.countryId;
    data['region_id'] = this.regionId;
    data['state_id'] = this.stateId;
    data['token'] = this.token;
    data['short_code'] = this.shortCode;
    data['accepted_by'] = this.acceptedBy;
    data['added_by'] = this.addedBy;
    data['reviewd_by'] = this.reviewdBy;
    data['sent_sms'] = this.sentSms;
    data['marketed_date'] = this.marketedDate;
    data['financial_date'] = this.financialDate;
    data['warehouse_date'] = this.warehouseDate;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['hand_delivery_fees'] = this.handDeliveryFees;
    data['reference_id'] = this.referenceId;
    data['transaction_id'] = this.transactionId;
    data['nitrates_image'] = this.nitratesImage;
    data['national_id'] = this.nationalId;
    data['national_id_image'] = this.nationalIdImage;
    data['notes'] = this.notes;
    return data;
  }
}