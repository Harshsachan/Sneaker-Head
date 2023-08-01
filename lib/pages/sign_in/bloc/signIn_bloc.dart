import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:SneakerHead/pages/sign_in/bloc/signIn_event.dart';
import 'package:SneakerHead/pages/sign_in/bloc/signIn_state.dart';
import 'package:SneakerHead/pages/sign_in/repo/signIn_model.dart';
import 'package:SneakerHead/pages/sign_in/repo/signIn_repo.dart';

class SignInBloc extends Bloc<SignInPageEvent,SignInPageState>{
  final SignInRepo _repositry;

  SignInBloc(this._repositry):super(SignInPageInitialState()){
    on<SignInFetchDataEvent>((event,emit)=>_fetchUserData(event,emit));
  }
  Future<void> _fetchUserData(SignInFetchDataEvent event, Emitter<SignInPageState> emit,) async{
    emit(SignInPageLoadingState());
    try{
      final user = await _repositry.fetchUserDetails(event.email, event.password);
      if(user.data['data']!= null) {
        emit(SignInPageSuccessState(
            LoggedInData.fromJson(user.data['data']['logIn'])));
      }
      else if(user.data['errors']!=null) {
        //print(user.data['errors'][0]['message']);
        emit(SignInPageDataNotFoundState(user.data['errors'][0]['message']));
      }
      else{
        emit(SignInPageErrorState("Unknown Error"));
      }
    }
    catch (error) {
      emit(SignInPageErrorState(error.toString()));
    }

  }
}