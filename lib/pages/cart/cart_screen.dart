import 'package:flutter/material.dart';
import 'package:testproject/pages/explore/ui/add_to_cart.dart';

import '../explore/repo/explore_model.dart';

class CartPage extends StatefulWidget {

  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  CartService cartService = CartService();
  List<ProductDetails> cartItems = [];

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    loadCartItems();
    super.didChangeDependencies();
  }

  void loadCartItems() async {
    List<ProductDetails> items = await cartService.getCartItems();
    setState(() {
      cartItems = items;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
        itemCount:  cartItems.length,
        itemBuilder: (context, index) {
          final product =  cartItems[index];
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
