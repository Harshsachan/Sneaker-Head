import '../repo/view_orders_model.dart';

abstract class ViewAllOrderState{}

class ViewAllOrderInitialState extends ViewAllOrderState{}

class ViewAllOrderNoOrderState extends ViewAllOrderState{}

class ViewAllOrderLoadingState extends ViewAllOrderState{}

class ViewAllOrderSuccessState extends ViewAllOrderState{
  final List<PlacedOrderData> placedOrderData;
  ViewAllOrderSuccessState(this.placedOrderData);
}

class ViewAllOrderErrorState extends ViewAllOrderState{
  final String error;
  ViewAllOrderErrorState(this.error);
}
