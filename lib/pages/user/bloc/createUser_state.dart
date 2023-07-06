import 'package:testproject/pages/sign_in/repo/signIn_model.dart';

abstract class CreateUserPageState{}

class CreateUserPageInitialState extends CreateUserPageState{}

class CreateUserPageLoadingState extends CreateUserPageState{}

class CreateUserPageSuccessState extends CreateUserPageState{

  final LoggedInData loggedInData;
  CreateUserPageSuccessState(this.loggedInData);
}

class CreateUserPageDataNotFoundState extends CreateUserPageState{}

class CreateUserPageErrorState extends CreateUserPageState{
  final String error;
  CreateUserPageErrorState(this.error);
}


