import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(const CounterStateData(count: 0));

    void increment() {
    if (state is CounterStateData) {
      final curentState = state as CounterStateData;
      emit(CounterStateData(count: curentState.count + 1));
    }
  }
}
