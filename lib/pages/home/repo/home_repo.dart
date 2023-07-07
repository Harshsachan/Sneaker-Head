import 'package:dio/dio.dart';
import 'package:SneakerHead/endPoint.dart';
import 'package:SneakerHead/pages/explore/repo/explore_model.dart';

class AllHomeProductDetails{
  final Dio _dio =Dio();
  Future<List<ProductDetails>> fetchAllHomeProduct() async{
    try{
      final response = await _dio.post(
        endpoint,
        data: {
          'query': '''
            query {
              findAllProduct{
                id
                name
                company
                description
                image
                createdAt
                price
                seller
                category
              }
            }
          ''',
        },
      );
      final List<dynamic> results = response.data['data']['findAllProduct'];
      final products = results.map((item) => ProductDetails.fromJson(item)).toList();
      return products;
    } catch(error){
      print("Error occured: $error");
      throw Exception('Failed to fetch products: $error');
    }
  }
}