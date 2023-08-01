import 'package:dio/dio.dart';
import 'package:SneakerHead/endPoint.dart';

class  SignInRepo{
  final Dio _dio = Dio();

  Future<Response<dynamic>> fetchUserDetails(String email,String password) async{
    try{
      final response = await _dio.post(
        endpoint,
        data: {
          'query':
          'mutation { '
              'logIn(authDto: '
              '{ '
              ' email: "$email", password: "$password" '
              '}) '
              ' { '
              '    uhid, f_name, l_name ,email,number,house_no,street,area,city,state,pincode } '
              ' }',
        }
      );
      return response;
    }
    catch(errors){
        throw errors.toString();
    }

  }


}