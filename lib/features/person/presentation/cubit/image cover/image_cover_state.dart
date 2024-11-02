import 'package:equatable/equatable.dart';

sealed class UlpoadeImageCoverState extends Equatable {
  const UlpoadeImageCoverState();

  @override
  List<Object> get props => [];
}

final class UlpoadeImageCoverInitial extends UlpoadeImageCoverState {}

final class UlpoadeImageCoverSuccess extends UlpoadeImageCoverState {
  final String success;

  const UlpoadeImageCoverSuccess({required this.success});

  @override
  List<Object> get props => [success];
}

final class UlpoadeImageCoverFailure extends UlpoadeImageCoverState {
  final String errorMessage;
  const UlpoadeImageCoverFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
