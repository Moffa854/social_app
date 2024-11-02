part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {
  const HomeInitial();

  @override
  List<Object> get props => [];
}

class Homeloading extends HomeState {

  const Homeloading();  

  @override
  List<Object> get props => [];
}

class Homesuccess extends HomeState {
  final PostModel post;

 const Homesuccess({required this.post});

  @override
  List<Object> get props => [post];
}

class Homefailuare extends HomeState {
  final String error;

  const Homefailuare({required this.error});

  @override
  List<Object> get props => [error];
}
