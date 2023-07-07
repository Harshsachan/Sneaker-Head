import 'package:SneakerHead/pages/sign_in/repo/signIn_model.dart';

abstract class SignInPageState{}

class SignInPageInitialState extends SignInPageState{}

class SignInPageLoadingState extends SignInPageState{}

class SignInPageSuccessState extends SignInPageState{
  final LoggedInData loggedInData;
  SignInPageSuccessState(this.loggedInData);
}

class SignInPageDataNotFoundState extends SignInPageState{
final String error;
SignInPageDataNotFoundState(this.error);
}

class SignInPageErrorState extends SignInPageState{
  final String error;
  SignInPageErrorState(this.error);
}