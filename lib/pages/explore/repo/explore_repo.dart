import 'package:dio/dio.dart';
import 'package:SneakerHead/endPoint.dart';
import 'explore_model.dart';

class AllProductDetails {
   final Dio _dio = Dio();

   Future<List<ProductDetails>> fetchAllProduct() async {
      try {
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
                averageRating
              }
            }
          ''',
            },
         );
         final List<dynamic> results = response.data['data']['findAllProduct'];
         final products = results.map((item) => ProductDetails.fromJson(item)).toList();
         return products;
      } catch (error) {
         throw Exception('Failed to fetch products: $error');
      }
   }
}


//DEMO
// query {
// characters(page: 1, filter: { name: "rick" }) {
// info {
// count
// }
// results {
// name
// gender
// }
// }
// }