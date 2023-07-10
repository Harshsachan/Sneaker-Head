import 'package:SneakerHead/pages/explore/repo/explore_model.dart';

abstract class HomePageState {}

class HomePageInitialState extends HomePageState{}

class HomePageLoadingState extends HomePageState{}

class HomePageSuccessState extends HomePageState{
  final List<ProductDetails> productDetails;
  HomePageSuccessState(this.productDetails);
}

class HomePageErrorState extends HomePageState{
  final String error;
  HomePageErrorState(this.error);
}