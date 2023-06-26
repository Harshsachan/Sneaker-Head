import 'package:flutter/material.dart';

import '../explore/repo/explore_model.dart';

class CartPage extends StatelessWidget {
  final List<ProductDetails> cartItems;

  const CartPage({Key? key, required this.cartItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final product = cartItems[index];
          return ListTile(
            title: Text('${product.name}'),
            subtitle: Text("product.company"),
            trailing: Text('\product.price'),
          );
        },
      ),
    );
  }
}
