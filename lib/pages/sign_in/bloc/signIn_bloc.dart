import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testproject/pages/sign_in/bloc/signIn_event.dart';
import 'package:testproject/pages/sign_in/bloc/signIn_state.dart';
import 'package:testproject/pages/sign_in/repo/signIn_model.dart';
import 'package:testproject/pages/sign_in/repo/signIn_repo.dart';

class SignInBloc extends Bloc<SignInPageEvent,SignInPageState>{
  final SignInrepo _repositry;

  SignInBloc(this._repositry):super(SignInPageInitialState()){
    on<SignInFetchDataEvent>((event,emit)=>_fetchUserData(event,emit));
  }
  Future<void> _fetchUserData(SignInFetchDataEvent event, Emitter<SignInPageState> emit,) async{
    emit(SignInPageLoadingState());
    try{
      print("in bloc");
      final user = await _repositry.fetchUserDetais(event.email, event.password);
      if(user.data['data']!= null) {
        print("user.data['data']");
        emit(SignInPageSuccessState(
            LoggedInData.fromJson(user.data['data']['logIn'])));
      }
      else if(user.data['errors']!=null) {
        print(user.data['errors'][0]['message']);
        emit(SignInPageDataNotFoundState(user.data['errors'][0]['message']));
      }
      else{
        emit(SignInPageErrorState("Unknown Error"));
      }
    }
    catch (error) {
      print("catch block");
      print(error);
      emit(SignInPageErrorState(error.toString()));
    }

  }
}