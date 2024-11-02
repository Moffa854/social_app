part of 'user_name_cubit.dart';

sealed class UserNameState extends Equatable {
  const UserNameState();

  @override
  List<Object> get props => [];
}

class UserNameInitial extends UserNameState {}

class UserNameLoading extends UserNameState {

  @override
  List<Object> get props => [];
}

class UserNameSuccess extends UserNameState {
    @override
  List<Object> get props => [];
}

class UserNameError extends UserNameState {
  final String errorMessage;
  UserNameError(this.errorMessage);
}

