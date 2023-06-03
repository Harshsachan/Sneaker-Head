import 'package:dio/dio.dart';
import 'explore_model.dart';

class AllProductDetails {
   final Dio _dio = Dio();

   Future<List<ProductDetails>> fetchAllProduct() async {
      try {
         print("functiona called");
         final response = await _dio.post(
            'https://54c3-183-82-1-143.ngrok-free.app/graphql',
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

         print("query correct");
         final List<dynamic> results = response.data['data']['findAllProduct'];
         print(results);

         final products = results.map((item) => ProductDetails.fromJson(item)).toList();

         return products;
      } catch (error) {
         print("Error occurred: $error");
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