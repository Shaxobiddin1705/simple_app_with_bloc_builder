import 'package:counter_with_bloc_builder/cubit/counter/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counterValue: 0));

  void increment() => emit(CounterState(counterValue: state.counterValue + 1));

  void decrement() => emit(CounterState(counterValue: state.counterValue - 1));
}