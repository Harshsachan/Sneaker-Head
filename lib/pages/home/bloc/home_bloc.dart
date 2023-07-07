import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testproject/pages/home/bloc/home_event.dart';
import 'package:testproject/pages/home/bloc/home_state.dart';
import 'package:testproject/pages/home/repo/home_repo.dart';

class  HomeBloc extends Bloc<HomePageEvent,HomePageState>{
  final AllHomeProductDetails _repositry;
  HomeBloc(this._repositry):super(HomePageInitialState()){
    on<HomePageDataFetchedEvent>((event,emit)=>_fetchAllHomeProducts(event,emit));

  }

  Future<void>_fetchAllHomeProducts(HomePageDataFetchedEvent event,Emitter<HomePageState> emit,)async{
    emit(HomePageInitialState());
    try{
      final products= await _repositry.fetchAllHomeProduct();
      emit(HomePageSuccessState(products));
    }catch(error){
      emit(HomePageErrorState(error.toString()));
    }
  }
}