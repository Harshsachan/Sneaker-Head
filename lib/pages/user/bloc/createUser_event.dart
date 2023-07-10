import 'package:SneakerHead/pages/sign_in/repo/signIn_model.dart';

abstract class CreateUserPageEvent{}

class CreateUserPostUserDataEvent extends CreateUserPageEvent{

  final LoggedInData loggedInData;
  CreateUserPostUserDataEvent(this.loggedInData);
}
// class CreateUserPostDataEvent extends CreateUserPageEvent{
//   final String email;
//   final String password;
//   CreateUserPostDataEvent(this.email,this.password);
// }