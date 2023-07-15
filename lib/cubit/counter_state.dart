part of 'counter_cubit.dart';

class CounterState extends Equatable {
  int count;
  bool wasIncremented;

  CounterState(this.wasIncremented, {required this.count,});

  @override
  List<Object> get props => [this.count];
}
