import 'package:SneakerHead/pages/sign_in/bloc/signIn_state.dart';

abstract class OrderPageState{}

class OrderPageInitialState extends OrderPageState{}

class OrderPageLoadingState extends OrderPageState{}

class OrderPageSuccessState extends OrderPageState{
  final String message;
  OrderPageSuccessState(this.message);
}

class OrderPageErrorState extends OrderPageState{
  final String error;
  OrderPageErrorState(this.error);
}

