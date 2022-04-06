
part of 'counter_cubit.dart';
 enum CounterStatus{initial,loading,success,failure}
 class CounterState extends Equatable {
   final int counter;
   final bool isFavorite;
   const CounterState( { required this.counter,this.isFavorite = false});

   factory CounterState.initial(){
     return  const CounterState(counter: 0,isFavorite: false);
   }

  @override
  List<Object> get props => [counter,isFavorite];
  @override
  String toString()=>'CounterState(counter: $counter)';

  CounterState copyWith({int? counter,bool? isFavorite}){
    return CounterState(counter: counter ?? this.counter,isFavorite: isFavorite??this.isFavorite);
}

}
