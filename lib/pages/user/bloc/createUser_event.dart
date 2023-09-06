import 'package:SneakerHead/pages/sign_in/repo/signIn_model.dart';

abstract class CreateUserPageEvent{}

class CreateUserPostUserDataEvent extends CreateUserPageEvent {

  final LoggedInData loggedInData;

  CreateUserPostUserDataEvent(this.loggedInData);
}