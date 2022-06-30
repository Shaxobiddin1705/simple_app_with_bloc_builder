import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:counter_with_bloc_builder/cubit/internet_connection/internet_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetCubit extends Cubit<InternetState>{
  final Connectivity connectivity;
  StreamSubscription? connectivityStreamSubscription;

  InternetCubit({required this.connectivity}) : super(InternetLoading()) {
    connectivityStreamSubscription = connectivity.onConnectivityChanged.listen((result) {
      if(result == ConnectivityResult.wifi) {
        emitInternetConnected(ConnectivityResult.wifi);
      } else if (result == ConnectivityResult.mobile) {
        emitInternetConnected(ConnectivityResult.mobile);
      }else if(result == ConnectivityResult.none){
        emitInternetDisconnected();
      }
    });
  }

  void emitInternetConnected(ConnectivityResult connectivityResult) => emit(InternetConnected(connectivityResult: connectivityResult));

  void emitInternetDisconnected( ) => emit(InternetDisconnected());

  @override
  Future<void> close() {
    connectivityStreamSubscription?.cancel();
    return super.close();
  }
}