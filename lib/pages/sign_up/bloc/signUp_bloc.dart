import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testproject/pages/sign_up/bloc/signUp_event.dart';
import 'package:testproject/pages/sign_up/bloc/signUp_state.dart';
import 'package:testproject/pages/sign_up/repo/signUp_model.dart';
import 'package:testproject/pages/sign_up/repo/signUp_repo.dart';


class SignUpBloc extends Bloc<SignUpPageEvent, SignUpPageState> {
  final SignUpRepo _repositry;


  SignUpBloc(this._repositry) : super(SignUpPageIntialState()){
    on<SignUpPostEvent> ((event,emit)=>_createUser(event,emit));
  }

  Future<void> _createUser(SignUpPostEvent event, Emitter<SignUpPageState> emit,) async {
    emit(SignUpPageLoadingState());
    try {
      print("USer created api call");
      final user = await _repositry.createUser(event.email, event.password);
      if(user.data['data'] != null){
        print("inside user.data['data'] != null");
        emit(SignUpPageSuccessState(SignUp.fromJson(user.data['data']['signUp'])));
      }else if(user.data['errors'] != null){
        print("inside user.data['errors'] != null");
        emit(SignUpPageErrorState(user.data['errors'][0]['message'].toString()));
      }else{
        print("inside else");
        emit(SignUpPageErrorState("Unknown Error"));
      }
      print("created call done");
    } catch (error) {
      print(error);
      emit(SignUpPageErrorState(error.toString()));
    }
  }
}