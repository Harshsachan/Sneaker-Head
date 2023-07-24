
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'no_internet_events.dart';
import 'no_internet_state.dart';

class InternetBloc extends Bloc<InternetEvents,InternetState>{
  StreamSubscription? checkConnectivity;
  Connectivity _connectivity =Connectivity();
  InternetBloc():super(InternetInitialState()){
    on<InternetLostEvent>((event, emit) => emit(InternetLostState()));
    on<InternetGainedEvent>((event, emit) => emit(InternetGainedState()));
    checkConnectivity = _connectivity.onConnectivityChanged.listen((result) {
      print('Connectivity Result');
      print(result.name);
      if(result==ConnectivityResult.wifi || result==ConnectivityResult.mobile )
        {
          add(InternetGainedEvent());
          emit(InternetGainedState());
          print('Connected to the internet via ${ConnectivityResult}');
        }
      else{
        add(InternetLostEvent());
        emit(InternetLostState());
        print("Please check your internet Connection  ${ConnectivityResult}");
      }
    });
  }

  @override
  Future<void> close() {
    checkConnectivity?.cancel();
    return super.close();
  }
}