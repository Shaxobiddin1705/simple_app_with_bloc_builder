import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:counter_with_bloc_builder/cubit/counter/counter_cubit.dart';
import 'package:counter_with_bloc_builder/cubit/users/user_cubit.dart';
import 'package:counter_with_bloc_builder/pages/counter_page.dart';
import 'package:counter_with_bloc_builder/pages/home_page.dart';
import 'package:counter_with_bloc_builder/pages/users_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/internet_connection/internet_cubit.dart';

void main() {
  runApp(MyApp(connectivity: Connectivity(),));
}

class MyApp extends StatelessWidget {
  final Connectivity connectivity;
  const MyApp({Key? key, required this.connectivity}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc Builder',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.amber,
          foregroundColor: Colors.indigo,
          centerTitle: true,
          elevation: 2
        )
      ),
      routes: {
        '/' : (context) => const HomePage(),
        '/users' : (context) => MultiBlocProvider(
          providers: [
            BlocProvider<UserCubit>(create: (context) => UserCubit()),
            BlocProvider<InternetCubit>(create: (context) => InternetCubit(connectivity: connectivity)),
          ],
          child: const UsersPage(),
        ),
        '/counter' : (context) => BlocProvider.value(
          value: CounterCubit(),
          child: const CounterPage(),
        ),
      },
      initialRoute: '/',
      // home: const HomePage(),
    );
  }
}