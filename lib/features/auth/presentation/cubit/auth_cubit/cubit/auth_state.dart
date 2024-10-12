part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class Homeloading extends AuthState {
  const Homeloading();

  @override
  List<Object> get props => [];
}

final class Homesuccess extends AuthState {
  @override
  List<Object> get props => [];
}

final class HomeError extends AuthState {
  final String error;

  const HomeError({required this.error});

  @override
  List<Object> get props => [error];
}
