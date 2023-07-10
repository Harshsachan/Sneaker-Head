import 'package:dio/dio.dart';
import 'package:SneakerHead/endPoint.dart';
import 'package:SneakerHead/pages/sign_in/repo/signIn_model.dart';
import 'package:SneakerHead/pages/user/bloc/createUser_state.dart';

class CreateUserRepo{
  final Dio _dio = Dio();
  Future<Response<dynamic>> postUserDetails(LoggedInData userDetails) async{
    print("postAuthDetails");
    try{
      final response = await _dio.post(
          endpoint,
          data: {
            'query':
            'mutation { '
                'createUser(createUserInput: '
                '{ '
                ' f_name:"${userDetails.fName}",l_name:"${userDetails.lName}",email :"${userDetails.email}",number: ${userDetails.number},house_no: "${userDetails.houseNo}",street:"${userDetails.street}",area: "${userDetails.area}",city: "${userDetails.city}",state: "${userDetails.state}",pincode: ${userDetails.pincode} '
                '}) '
                ' { '
                '    uhid f_name l_name email number house_no street area city state pincode'
                ' }'
            '}',
          }
      );
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