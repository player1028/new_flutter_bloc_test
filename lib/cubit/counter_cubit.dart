import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';


part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(count: 0,true));

  void increment() => emit(CounterState(count: state.count + 1, true));
  void decrement() {
    if(state.count<=0)return;
    emit(CounterState(count: state.count - 1, false));
  }

}
