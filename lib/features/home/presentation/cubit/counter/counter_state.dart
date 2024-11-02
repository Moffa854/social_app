part of 'counter_cubit.dart';

sealed class CounterState extends Equatable {
  const CounterState();

  @override
  List<Object> get props => [];
}

final class CounterInitial extends CounterState {}
class CounterStateData extends CounterState {
 
  final int count;

 const CounterStateData({required this.count});
  
 
}