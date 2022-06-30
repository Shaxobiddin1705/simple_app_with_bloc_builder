import 'dart:convert';
import 'dart:developer';

import 'package:counter_with_bloc_builder/cubit/users/user_state.dart';
import 'package:counter_with_bloc_builder/models/UsersModel.dart';
import 'package:counter_with_bloc_builder/services/dio_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserState(users: []));

  Future<void> getUsers() async{
    DioService.get(api: DioService.apiGetUsers, params: DioService.paramsEmpty()).then((value) {
      if(value != null) {
        log(value);
        Iterable result = json.decode(value);
        List<UsersModel> usersList =  List<UsersModel>.from(result.map((e) => UsersModel.fromJson(e)));
        emit(UserState(users: usersList));
      }
    });
  }
}