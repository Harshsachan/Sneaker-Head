import 'package:SneakerHead/endPoint.dart';
import 'package:dio/dio.dart';

import '../../explore/repo/explore_model.dart';
import 'product_model.dart';
import 'view_orders_model.dart';



class ViewPlacedOrderRepo{
  final Dio _dio=Dio();

  Future<List<PlacedOrderData>> fetchAllOrders(String? email) async{
    print("fetchAllOrders bloc");
    try {
      final response = await _dio.post(
        endpoint2,
        data: {
          'query': 'query{ findOrderByUserMail(customer_email: "$email") { customer_full_name customer_number customer_email address total_price product_ids created_at } }',
        },
      );
      print("object");
      final List<dynamic> results = response.data['data']['findOrderByUserMail'];
      final orders = results.map((item) => PlacedOrderData.fromJson(item)).toList();
      print("All Orders fetched");
      print(orders);
      return orders;
    }
    catch(err){
      print("Error occurred: $err");
      throw Exception("Failed to fetch Orders: $err");
    }
  }

  Future<Product> fetchProductById(int id) async {
    try {
      final response = await _dio.post(
        endpoint2,
        data: {
          'query': 'query{ findProductById(id: $id) { price, name, description } }',
        },
      );
      final productData = response.data['data']['findProductById'];
      final product = Product.fromJson(productData);
      return product;
    } catch (err) {
      print("Error occurred: $err");
      throw Exception("Failed to fetch product: $err");
    }
  }
}