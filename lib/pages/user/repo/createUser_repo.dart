import 'package:dio/dio.dart';
import 'package:SneakerHead/endPoint.dart';
import 'package:SneakerHead/pages/sign_in/repo/signIn_model.dart';

class CreateUserRepo{
  final Dio _dio = Dio();
  Future<Response<dynamic>> postUserDetails(LoggedInData userDetails) async{
    try{
      final response = await _dio.post(
          endpoint,
          data: {
            'query':
            'mutation { '
                'createUser(createUserInput: '
                '{ '
                ' f_name:"${userDetails.fName}",l_name:"${userDetails.lName}",email :"${userDetails.email}",number: ${userDetails.number},house_no: "${userDetails.houseNo}",street:"${userDetails.street}",area: "${userDetails.area}",city: "${userDetails.city}",state: "${userDetails.state}",pincode: ${userDetails.pincode},size: ${userDetails.size} '
                '}) '
                ' { '
                '    uhid f_name l_name email number house_no street area city state pincode size'
                ' }'
            '}',
          }
      );
      return response;

    }
    catch(errors){
      throw errors.toString();
    }
  }
}