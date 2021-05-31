part of 'counter_bloc.dart';

class CounterState {
  final int count;
  final bool wasIncremented;

  CounterState({@required this.count, this.wasIncremented});
}
