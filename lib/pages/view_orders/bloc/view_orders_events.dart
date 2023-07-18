abstract class ViewAllOrderEvents{}

class FindAllOrderEvents extends ViewAllOrderEvents{
  final String? email;
  FindAllOrderEvents(this.email);
}