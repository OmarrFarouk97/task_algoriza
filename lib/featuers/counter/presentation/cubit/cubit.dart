import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_task_algoriza/featuers/counter/presentation/cubit/states.dart';

class CounterCubit extends Cubit<CounterStates> {
  CounterCubit() : super(CounterInitialState());

  static CounterCubit get(context) => BlocProvider.of<CounterCubit>(context);

  int counter = 1;

  void increment() {
    counter++;
    //debugPrint('$counter');
    emit(CounterIncrementState());
  }

  void decrement() {
    counter--;
    //debugPrint('$counter');
    emit(CounterDecrementState());
  }
}