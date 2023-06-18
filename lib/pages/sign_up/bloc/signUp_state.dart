import 'package:testproject/pages/sign_up/repo/signUp_model.dart';

abstract class SignUpPageState{}

class SignUpPageIntialState extends SignUpPageState{}

class SignUpPageLoadingState extends SignUpPageState{}

class SignUpPageSuccessState extends SignUpPageState{
  final SignUp signup;
  SignUpPageSuccessState(this.signup);
}

class SignUpPageErrorState extends SignUpPageState{
  final String error;

  SignUpPageErrorState(this.error);
}
