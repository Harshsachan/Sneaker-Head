import 'package:SneakerHead/pages/sign_up/repo/signUp_model.dart';

abstract class SignUpPageState{}

class SignUpPageInitialState extends SignUpPageState{}

class SignUpPageLoadingState extends SignUpPageState{}

class SignUpPageSuccessState extends SignUpPageState{
  final SignUp signup;
  SignUpPageSuccessState(this.signup);
}

class SignUpPageErrorState extends SignUpPageState{
  final String error;

  SignUpPageErrorState(this.error);
}
