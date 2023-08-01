import '../repo/explore_model.dart';

abstract class ExplorePageState{}

class ExplorePageInitialState extends ExplorePageState{}

class ExplorePageLoadingState extends ExplorePageState{}

class ExplorePageLoadedState extends ExplorePageState{
  final List<ProductDetails> productDetails;

  ExplorePageLoadedState(this.productDetails);
}

class ExplorePageErrorState extends ExplorePageState{
  final String error;

  ExplorePageErrorState(this.error);
}