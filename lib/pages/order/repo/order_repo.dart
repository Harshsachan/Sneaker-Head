import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:testproject/endPoint.dart';

class PlaceOrderRepo {
  final Dio _dio = Dio();

  Future<Response<dynamic>> placeOrder(
      List<int?> productIds, String? userEmail) async {
    print("Place Order Api Called");
    try {
      final response = await _dio.post(endpoint, data: {
        'query': ' mutation{'
            'createNewOrder(createOrderInput:{'
            'product_ids:$productIds,'
            'user_email:"$userEmail"'
      '})}'
      });
      print("Order placed Api call Succesfull");
      print(response);
      return response;
    } catch (error) {
      print("catch block");
      print(error.toString());
      throw error.toString();
    }
  }
}
