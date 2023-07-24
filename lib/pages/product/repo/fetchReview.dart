import 'package:dio/dio.dart';

import '../../../endPoint.dart';
import 'ratingsReview_model.dart';

class FetchReviewRepo{
  final Dio _dio=Dio();

  Future<List<FindReviewsAndRatingsByProductId>> fetchAllReview() async{
    const id=1;
      try {
        final response = await _dio.post(
          endpoint,
          data: {
            'query': '''
            query {
              findReviewsAndRatingsByProductId(product_id:$id){
                customer_email,
                customer_full_name,
                rating,
                review
                product_ids
              }
            }
          ''',
          },
        );
        final List<dynamic> results = response.data['data']['findReviewsAndRatingsByProductId'];
        final reviews = results.map((item) => FindReviewsAndRatingsByProductId.fromJson(item)).toList();
        return reviews;
    }
        catch(err){
          print("Error occurred: $err");
          throw Exception('Failed to fetch Reviews: $err');
        }
  }
}