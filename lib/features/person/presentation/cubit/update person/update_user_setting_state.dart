import 'package:equatable/equatable.dart';

sealed class UpdateUserPersonState extends Equatable {
  const UpdateUserPersonState();

  @override
  List<Object> get props => [];
}

final class UpdateUserSettingInitial extends UpdateUserPersonState {}

final class UpdateUserLoading extends UpdateUserPersonState {
  const UpdateUserLoading();
}

final class UpdateUserSuccess extends UpdateUserPersonState {
  const UpdateUserSuccess();
}

final class UpdateUserFailure extends UpdateUserPersonState {
  final String errorMessage;
  const UpdateUserFailure({required this.errorMessage});
}
