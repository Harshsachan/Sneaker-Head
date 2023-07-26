class Product {
  final int price;
  final String name;
  final String description;
  final String image;


  Product({required this.price, required this.name, required this.description,required this.image});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      price: json['price'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
    );
  }
}