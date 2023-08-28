abstract class OrderPageEvent{}

class OrderPagePlaceOrderEvent extends OrderPageEvent{
  final String? userEmail;
  final List<int?> productIds;
  final int? totalPrice;
  final String? userName;
  final int? userNumber;
  final String? address;
  final int? userSize;

  OrderPagePlaceOrderEvent(this.userEmail,this.productIds,this.totalPrice,this.userName,
      this.userNumber,this.address,this.userSize);
}