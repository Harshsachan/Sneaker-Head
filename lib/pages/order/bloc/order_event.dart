abstract class OrderPageEvent{}

class OrderPagePlaceOrderEvent extends OrderPageEvent{
  final String? userEmail;
  final List<int?> ProductIds;

  OrderPagePlaceOrderEvent(this.userEmail,this.ProductIds);
}