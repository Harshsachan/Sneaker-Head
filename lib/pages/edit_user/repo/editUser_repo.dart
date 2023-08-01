import 'package:SneakerHead/endPoint.dart';
import 'package:SneakerHead/pages/sign_in/repo/signIn_model.dart';
import 'package:dio/dio.dart';

class EditUserRepo {
  final Dio _dio= Dio();

  Future<Response<dynamic>> updateUserDetails(LoggedInData userDetails)async{
    try{
      final respose = await _dio.post(
        endpoint,
        data: {
          'query':
          'mutation { '
              'updateUserInfo(updateUserInput: '
              '{ '
              ' f_name:"${userDetails.fName}",l_name:"${userDetails.lName}",email :"${userDetails.email}",number: ${userDetails.number},house_no: "${userDetails.houseNo}",street:"${userDetails.street}",area: "${userDetails.area}",city: "${userDetails.city}",state: "${userDetails.state}",pincode: ${userDetails.pincode} '
              '}) '
              ' { '
              '    uhid f_name l_name email number house_no street area city state pincode'
              ' }'
              '}',
        }
      );
      return respose;
    }
    catch(error){
      throw error.toString();
    }
  }

}