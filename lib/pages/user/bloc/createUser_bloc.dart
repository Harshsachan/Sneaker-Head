import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:SneakerHead/pages/sign_in/repo/signIn_model.dart';
import 'package:SneakerHead/pages/user/bloc/createUser_event.dart';
import 'package:SneakerHead/pages/user/repo/createUser_repo.dart';

import 'createUser_state.dart';

class CreateUserBloc extends Bloc<CreateUserPageEvent,CreateUserPageState>{
  final CreateUserRepo _repositry;

  CreateUserBloc(this._repositry):super(CreateUserPageInitialState()){
    on<CreateUserPostUserDataEvent>((event,emit)=> _postUserDetails(event,emit));

  }
  Future<void> _postUserDetails(CreateUserPostUserDataEvent event,Emitter<CreateUserPageState> emit)async{
    emit(CreateUserPageLoadingState());
    try{
      final response =await _repositry.postUserDetails(event.loggedInData);
      emit(CreateUserPageSuccessState(LoggedInData.fromJson(response.data['data']['createUser'])));
    }
    catch(error){
     throw Exception(error.toString());
    }
  }


}