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
  late double averageRating; // Marking as late

  ProductDetails({
    this.id,
    this.name,
    this.company,
    this.description,
    this.image,
    this.createdAt,
    this.price,
    this.seller,
    this.category,
    double? averageRating, // Marking as nullable in the constructor
  }) : averageRating = averageRating ?? 0.0; // Assigning a value in the constructor

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

    var jsonAverageRating = json['averageRating'];
    if (jsonAverageRating is int) {
      averageRating = jsonAverageRating.toDouble();
    } else {
      averageRating = jsonAverageRating ?? 0.0;
    }
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
    data['averageRating'] = this.averageRating;
    return data;
  }
}
