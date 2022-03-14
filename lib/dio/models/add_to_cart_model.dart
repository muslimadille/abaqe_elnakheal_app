class AddToCartModel {
  int? cartCount;

  AddToCartModel({this.cartCount});

  AddToCartModel.fromJson(Map<String, dynamic> json) {
    cartCount = json['cart_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cart_count'] = this.cartCount;
    return data;
  }
}