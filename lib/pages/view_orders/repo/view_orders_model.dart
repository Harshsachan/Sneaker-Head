import 'product_model.dart';

class PlacedOrderDetails {
  Data? data;

  PlacedOrderDetails({this.data});

  PlacedOrderDetails.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<PlacedOrderData>? findOrderByUserMail;

  Data({this.findOrderByUserMail});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['findOrderByUserMail'] != null) {
      findOrderByUserMail = <PlacedOrderData>[];
      json['findOrderByUserMail'].forEach((v) {
        findOrderByUserMail!.add(new PlacedOrderData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.findOrderByUserMail != null) {
      data['findOrderByUserMail'] =
          this.findOrderByUserMail!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PlacedOrderData {
  String? customerFullName;
  int? customerNumber;
  String? customerEmail;
  String? address;
  int? totalPrice;
  List<int>? productIds;
  String? createdAt;
  Product? product;

  PlacedOrderData(
      {this.customerFullName,
        this.customerNumber,
        this.customerEmail,
        this.address,
        this.totalPrice,
        this.productIds,
        this.createdAt,this.product,});

  PlacedOrderData.fromJson(Map<String, dynamic> json) {
    customerFullName = json['customer_full_name'];
    customerNumber = json['customer_number'];
    customerEmail = json['customer_email'];
    address = json['address'];
    totalPrice = json['total_price'];
    productIds = json['product_ids'].cast<int>();
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customer_full_name'] = this.customerFullName;
    data['customer_number'] = this.customerNumber;
    data['customer_email'] = this.customerEmail;
    data['address'] = this.address;
    data['total_price'] = this.totalPrice;
    data['product_ids'] = this.productIds;
    data['created_at'] = this.createdAt;
    return data;
  }
}
