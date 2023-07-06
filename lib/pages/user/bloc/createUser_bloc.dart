import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testproject/pages/sign_in/repo/signIn_model.dart';
import 'package:testproject/pages/user/bloc/createUser_event.dart';
import 'package:testproject/pages/user/repo/createUser_repo.dart';

import 'createUser_state.dart';

class CreateUserBloc extends Bloc<CreateUserPageEvent,CreateUserPageState>{
  final CreateUserRepo _repositry;

  CreateUserBloc(this._repositry):super(CreateUserPageInitialState()){
    // on<CreateUserPostDataEvent>((event,emit)=> _postAuthDetails(event,emit));
    on<CreateUserPostUserDataEvent>((event,emit)=> _postUserDetails(event,emit));

  }
  // Future<void> _postAuthDetails(CreateUserPostDataEvent event,Emitter<CreateUserPageState> emit)async{
  //   emit(CreateUserPageLoadingState());
  //   try{
  //     print("_postAuthDetails bloc");
  //     final response =await _repositry.postAuthDetails(event.email, event.password);
  //     print(response);
  //   }
  //   catch(error){
  //     print(error);
  //   }
  //
  // }

  Future<void> _postUserDetails(CreateUserPostUserDataEvent event,Emitter<CreateUserPageState> emit)async{
    emit(CreateUserPageLoadingState());
    print("_postUserDetails in bloc");
    try{
      final response =await _repositry.postUserDetails(event.loggedInData);
      print(response);
      emit(CreateUserPageSuccessState(LoggedInData.fromJson(response.data['data']['createUser'])));
    }
    catch(error){
      print(error);
    }
  }


}