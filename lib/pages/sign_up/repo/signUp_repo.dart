import 'package:dio/dio.dart';
import 'package:SneakerHead/endPoint.dart';

class SignUpRepo{
  final Dio _dio =Dio();

  Future<Response<dynamic>> createUser(String email, String password) async {
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
      return response;
    } catch (errors) {
      throw errors.toString();
    }
  }
}