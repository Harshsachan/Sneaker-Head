import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  //final List<ProductDetails> cartItems;,, required this.cartItems

  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
         // final product = cartItems[index];
          return ListTile(
            title: Text("product.name"),
            subtitle: Text("product.company"),
            trailing: Text('\product.price'),
          );
        },
      ),
    );
  }
}
