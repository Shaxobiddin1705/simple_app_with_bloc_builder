import 'dart:developer';

import 'package:counter_with_bloc_builder/cubit/internet_connection/internet_cubit.dart';
import 'package:counter_with_bloc_builder/cubit/internet_connection/internet_state.dart';
import 'package:counter_with_bloc_builder/cubit/users/user_cubit.dart';
import 'package:counter_with_bloc_builder/cubit/users/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<UserCubit>(context).getUsers();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InternetCubit, InternetState>(
      builder: (context, internetState) {
        if(internetState is InternetConnected) {
          BlocProvider.of<UserCubit>(context).getUsers();
          return Scaffold(
            appBar: AppBar(
              title: const Text('Users'),
            ),
            body: BlocBuilder<UserCubit, UserState>(
              builder: (context, state) => state.users.isNotEmpty ? ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: state.users.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network('https://randomuser.me/api/portraits/men/${state.users[index].id}.jpg'),
                    ),
                    title: Text(state.users[index].name.toString(),
                      style: const TextStyle(color: Colors.indigo, fontSize: 17, fontWeight: FontWeight.w800),),
                    subtitle: Text(state.users[index].phone.toString(), style: const TextStyle(color: Colors.amber),),
                  );
                },
              ) : const Center(child: CircularProgressIndicator(),),
            ),
          );
        } else {
          return Scaffold(
            body: Center(
              child: Lottie.asset('assets/lotties/internet_connection.json'),
            ),
          );
        }
      }
    );
  }
}
