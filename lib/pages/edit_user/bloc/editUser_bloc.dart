import 'package:SneakerHead/pages/edit_user/bloc/editUser_event.dart';
import 'package:SneakerHead/pages/edit_user/bloc/editUser_state.dart';
import 'package:SneakerHead/pages/sign_in/repo/signIn_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repo/editUser_repo.dart';

class EditUserBloc extends Bloc<EditUserPageEvent,EditUserPageState>{
  final EditUserRepo _repositry;
  EditUserBloc(this._repositry):super(EditUserPageInitialState()){
    on<EditUserPageUpdateUserDetailsEvent>((event, emit) => _updateUserDetails(event,emit));

  }

  Future<void> _updateUserDetails(EditUserPageUpdateUserDetailsEvent event ,Emitter<EditUserPageState> emit)async{
    emit(EditUserPageLoadingState());
    print("_updateUserDetails in bloc");
    try{
      final response =await _repositry.updateUserDetails(event.loggedInData);
      print(response);
      emit(EditUserPageSuccessState(LoggedInData.fromJson(response.data['data']['updateUserInfo'])));
    }
    catch(error){
      emit(EditUserPageErrorState(error.toString()));
      print(error.toString());
    }
  }
}