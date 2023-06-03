class ProductDetails {
  int? id;
  String? name;
  String? company;
  String? description;
  String? image;
  Null? createdAt;
  int? price;
  String? seller;
  String? category;

  ProductDetails(
      {this.id,
        this.name,
        this.company,
        this.description,
        this.image,
        this.createdAt,
        this.price,
        this.seller,
        this.category});

  ProductDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    company = json['company'];
    description = json['description'];
    image = json['image'];
    createdAt = json['createdAt'];
    price = json['price'];
    seller = json['seller'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['company'] = this.company;
    data['description'] = this.description;
    data['image'] = this.image;
    data['createdAt'] = this.createdAt;
    data['price'] = this.price;
    data['seller'] = this.seller;
    data['category'] = this.category;
    return data;
  }
}
