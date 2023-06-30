import 'package:dio/dio.dart';
import 'package:testproject/endPoint.dart';

class  SignInrepo{
  final Dio _dio = Dio();

  Future<Response<dynamic>> fetchUserDetais(String email,String password) async{
    print("fetchUserDetais");
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
      print("UserData fetched");
      print(response);
      return response;
    }
    catch(errors){
      print("Catch block");
      print(errors);
        throw errors.toString();
    }

  }


}