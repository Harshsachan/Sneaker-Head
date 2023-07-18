import 'package:flutter_bloc/flutter_bloc.dart';

import '../repo/view_orders_model.dart';
import '../repo/view_orders_repo.dart';
import 'view_orders_events.dart';
import 'view_orders_state.dart';

class ViewAllOrderBloc extends Bloc<ViewAllOrderEvents,ViewAllOrderState>{
  final ViewPlacedOrderRepo _repositry;
  ViewAllOrderBloc(this._repositry):super(ViewAllOrderInitialState()){
    on<FindAllOrderEvents>((event, emit) => _fetchAllOrder(event,emit));
  }
  
  Future<void> _fetchAllOrder(FindAllOrderEvents event,Emitter<ViewAllOrderState>emit)async{
    emit(ViewAllOrderLoadingState());
    print("_fetchAllOrder in bloc");
    try{
      final response = await _repositry.fetchAllOrders(event.email);
      print(response);
      emit(ViewAllOrderSuccessState(response));
    }
    catch(err)
    {
      emit(ViewAllOrderErrorState(err.toString()));
      print(err.toString());
    }
  }
}