import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:SneakerHead/pages/explore/bloc/explore_event.dart';
import 'package:SneakerHead/pages/explore/bloc/explore_state.dart';

import '../repo/explore_repo.dart';

class ExploreBloc extends Bloc<ExplorePageEvent,ExplorePageState>{
  final AllProductDetails _repository;
  ExploreBloc(this._repository):super(ExplorePageInitialState()){
    on<ExplorePageFetchProductEvent>((event, emit) => _fetchAllProducts(event, emit));

  }
  Future<void> _fetchAllProducts(ExplorePageFetchProductEvent event, Emitter<ExplorePageState> emit,) async {
    emit(ExplorePageLoadingState());
    try {
      final products = await _repository.fetchAllProduct();
      emit(ExplorePageLoadedState(products));
    } catch (error) {
      emit(ExplorePageErrorState(error.toString()));
    }
  }

}