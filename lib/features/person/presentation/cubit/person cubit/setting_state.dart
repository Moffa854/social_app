import 'package:equatable/equatable.dart';
import 'package:social_app/features/auth/data/models/auth_model.dart';

abstract class PersonState extends Equatable {
  const PersonState();

  @override
  List<Object> get props => [];
}

class SettingInitial extends PersonState {}

class SettingLoading extends PersonState {
  const SettingLoading();
}

class SettingSuccess extends PersonState {
  final UserModel userModel;
  const SettingSuccess({required this.userModel});
}

class SettingFailure extends PersonState {
  final String errorMessage;
  const SettingFailure({required this.errorMessage});
}
