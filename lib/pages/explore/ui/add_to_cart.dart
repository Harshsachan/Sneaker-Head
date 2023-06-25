import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testproject/pages/explore/repo/explore_model.dart';

class CartHelper {
  static const String _cartKey = 'cart';

  Future<List<ProductDetails>> getCartItems() async {
    final prefs = await SharedPreferences.getInstance();
    final cartData = prefs.getString(_cartKey);
    if (cartData != null) {
      final List<dynamic> decodedData = json.decode(cartData);
      final List<ProductDetails> cartItems = decodedData
          .map((item) => ProductDetails.fromJson(item))
          .toList();
      return cartItems;
    }
    return [];
  }

  Future<bool> addToCart(ProductDetails product) async {
    final prefs = await SharedPreferences.getInstance();
    final cartData = prefs.getString(_cartKey);
    List<ProductDetails> cartItems = [];

    if (cartData != null) {
      final List<dynamic> decodedData = json.decode(cartData);
      cartItems = decodedData
          .map((item) => ProductDetails.fromJson(item))
          .toList();
    }

    cartItems.add(product);
    final encodedData = json.encode(cartItems);
    return prefs.setString(_cartKey, encodedData);
  }

  Future<bool> removeFromCart(ProductDetails product) async {
    final prefs = await SharedPreferences.getInstance();
    final cartData = prefs.getString(_cartKey);
    List<ProductDetails> cartItems = [];

    if (cartData != null) {
      final List<dynamic> decodedData = json.decode(cartData);
      cartItems = decodedData
          .map((item) => ProductDetails.fromJson(item))
          .toList();
    }

    cartItems.removeWhere((item) => item.id == product.id);
    final encodedData = json.encode(cartItems);
    return prefs.setString(_cartKey, encodedData);
  }
}
