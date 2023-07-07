import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:SneakerHead/pages/explore/repo/explore_model.dart';
class CartService {
  static const String CART_KEY = 'cart';

  Future<List<ProductDetails>> getCartItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? cartJson = prefs.getString(CART_KEY);
    if (cartJson != null) {
      List<dynamic> cartData = jsonDecode(cartJson);
      List<ProductDetails> cartItems = cartData
          .map((data) => ProductDetails.fromJson(data))
          .toList();
      return cartItems;
    } else {
      return [];
    }
  }

  Future<void> saveCartItems(List<ProductDetails> cartItems) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Map<String, dynamic>> cartData = cartItems
        .map((item) => item.toJson())
        .toList();
    String cartJson = jsonEncode(cartData);
    await prefs.setString(CART_KEY, cartJson);
  }

  Future<void> removeCartItem(ProductDetails product) async {
    List<ProductDetails> cartItems = await getCartItems();
    cartItems.removeWhere((item) => item.id == product.id);
    await saveCartItems(cartItems);
  }
}
