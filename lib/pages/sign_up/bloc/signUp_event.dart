abstract class SignUpPageEvent{}

class SignUpPostEvent extends SignUpPageEvent{
  final String email;
  final String password;

  SignUpPostEvent(this.email,this.password);
}