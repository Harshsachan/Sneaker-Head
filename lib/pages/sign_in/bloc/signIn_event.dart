abstract class SignInPageEvent{}

class SignInFetchDataEvent extends SignInPageEvent{
  final String email;
  final String password;

  SignInFetchDataEvent(this.email,this.password);
}