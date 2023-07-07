import 'package:dio/dio.dart';
import 'package:SneakerHead/endPoint.dart';
import 'package:SneakerHead/pages/sign_up/repo/signUp_model.dart';

class SignUpRepo{
  final Dio _dio =Dio();

  Future<Response<dynamic>> createUser(String email, String password) async {
    //final endpoint = 'https://24b3-122-171-124-171.ngrok-free.app/graphql';
    print("in sign up repo");
    try {
      final response = await _dio.post(
        endpoint,
        data: {
          'query':
            'mutation { '
              'signUp(authDto: '
              '{ '
              ' email: "$email", password: "$password" '
              '}) '
              ' { '
              '   email, password } '
              ' }',
        },
      );
      print(response);
      // if(response.data['errors'] != null){
      //   print(response.data['errors'][0]['message']);
      // }else{
      //   final responseData = response.data['data']['signUp'];
      //   print(responseData);
      // }

      return response;
    } catch (errors) {
      print("error");
     print(errors);
      throw errors.toString();
    }
  }
}