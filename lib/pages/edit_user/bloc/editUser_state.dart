import 'package:SneakerHead/pages/sign_in/repo/signIn_model.dart';

abstract class EditUserPageState{}

class EditUserPageInitialState extends EditUserPageState{}

class EditUserPageLoadingState extends EditUserPageState{}

class EditUserPageSuccessState extends EditUserPageState{
  final LoggedInData loggedInData;
  EditUserPageSuccessState(this.loggedInData);
}

class EditUserPageErrorState extends EditUserPageState{
  final String error;
  EditUserPageErrorState(this.error);
}