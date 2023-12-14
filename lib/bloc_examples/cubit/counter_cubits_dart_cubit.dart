import 'package:bloc/bloc.dart';
part 'counter_cubits_dart_state.dart';

class CounterCubitsDartCubit extends Cubit<CounterState> {
  CounterCubitsDartCubit() : super(CounterState(counterValue: 0));
  void increment() => emit(CounterState(counterValue: state.counterValue! + 1));
  void decrement() => emit(CounterState(counterValue: state.counterValue! - 1));
}
