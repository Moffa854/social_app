import 'package:equatable/equatable.dart';

sealed class UlpoadeImageProfileState extends Equatable {
  const UlpoadeImageProfileState();

  @override
  List<Object> get props => [];
}

final class UlpoadeImageInitial extends UlpoadeImageProfileState {}

final class UlpoadeImageSuccess extends UlpoadeImageProfileState {
  final String success;

  const UlpoadeImageSuccess({required this.success});

  @override
  List<Object> get props => [success];
}

final class UlpoadeImageFailure extends UlpoadeImageProfileState {
  final String errorMessage;
  const UlpoadeImageFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
