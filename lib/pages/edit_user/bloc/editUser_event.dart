import 'package:SneakerHead/pages/sign_in/repo/signIn_model.dart';

abstract class EditUserPageEvent{}

class EditUserPageUpdateUserDetailsEvent extends EditUserPageEvent{
  final LoggedInData loggedInData;
  EditUserPageUpdateUserDetailsEvent(this.loggedInData);
}
