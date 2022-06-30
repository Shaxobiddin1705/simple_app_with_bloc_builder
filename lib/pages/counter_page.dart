import 'dart:developer';

import 'package:counter_with_bloc_builder/cubit/counter/counter_cubit.dart';
import 'package:counter_with_bloc_builder/cubit/counter/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter with BlocBuilder'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          const Text('Here you can see using blocBuilder', style: TextStyle(fontSize: 20),),

          const SizedBox(height: 30,),

          BlocBuilder<CounterCubit, CounterState>(
            builder: (context, state) => Text(state.counterValue.toString(), style: const TextStyle(fontSize: 30),),
          ),

          const SizedBox(height: 30,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              FloatingActionButton(
                heroTag: 'button1',
                backgroundColor: Colors.indigo,
                onPressed: (){
                  BlocProvider.of<CounterCubit>(context).decrement();
                },
                child: Icon(Icons.remove),
              ),


              FloatingActionButton(
                heroTag: 'button2',
                backgroundColor: Colors.indigo,
                onPressed: (){
                  BlocProvider.of<CounterCubit>(context).increment();
                },
                child: Icon(Icons.add),
              ),


            ],
          ),

        ],
      ),
    );
  }
}
