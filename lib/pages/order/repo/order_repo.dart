import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:SneakerHead/endPoint.dart';

class PlaceOrderRepo {
  final Dio _dio = Dio();

  Future<Response<dynamic>> placeOrder(
      String? userEmail,List<int?> productIds,int? totalPrice, String? userName,int? userNumber,
      String? address) async {
    print("Place Order Api Called");
    try {

      final response = await _dio.post(endpoint, data: {
        'query':
        ' mutation{'
            'createNewOrder(createOrderInput:{'
            'product_ids:$productIds,'
            'customer_email:"$userEmail",'
        'total_price:$totalPrice, customer_full_name:"$userName"'
        'customer_number:$userNumber,address:"$address"'
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
