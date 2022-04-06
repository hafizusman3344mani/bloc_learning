import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
part 'counter_state.dart';
class CounterCubit extends Cubit<CounterState>{
  CounterCubit() : super(CounterState.initial());

  void increment(){
    emit(state.copyWith(counter: state.counter + 1,));
  }
  void decrement(){
    emit(state.copyWith(counter: state.counter-1,));
  }

  void favorite(){
    emit(state.copyWith(isFavorite:true));
  }
  void unFavorite(){
    emit(state.copyWith(isFavorite:false));
  }

}
