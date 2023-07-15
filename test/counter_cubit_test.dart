
import 'package:flutter_test/flutter_test.dart';
import 'package:new_one/cubit/counter_cubit.dart';

void main() {
  group('Counter Cubit', () {
    late CounterCubit counterCubit;

    setUp((){
      counterCubit = CounterCubit();
    });

    tearDown(() => counterCubit.close());

    test('Counter Cubit state must have 0 ', (){
      expect(counterCubit.state, CounterState(true, count: 0));
    });
  });
}