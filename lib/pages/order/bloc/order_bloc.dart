import 'package:flutter_bloc/flutter_bloc.dart';

import '../repo/order_repo.dart';
import 'order_event.dart';
import 'order_state.dart';

class OrderPageBloc extends Bloc<OrderPagePlaceOrderEvent,OrderPageState>{
  final PlaceOrderRepo _repositry;
  OrderPageBloc(this._repositry):super(OrderPageInitialState()){
    on<OrderPagePlaceOrderEvent>((event,emit)=>_placeOrder(event,emit));
  }
  Future<void>_placeOrder(OrderPagePlaceOrderEvent event,Emitter<OrderPageState>emit,) async{
    emit(OrderPageLoadingState());
    try{
      print("in bloc try");
      final data = await _repositry.placeOrder(event.userEmail,event.productIds,event.totalPrice,event.userName,event.userNumber,event.address);
      print(data);
      emit(OrderPageSuccessState("message"));
    }
    catch (error){
      print("in bloc catch block");
      print(error);
      emit(OrderPageErrorState(error.toString()));
    }
  }

}