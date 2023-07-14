class Product {
  final int price;
  final String name;
  final String description;

  Product({required this.price, required this.name, required this.description});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      price: json['price'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
    );
  }
}