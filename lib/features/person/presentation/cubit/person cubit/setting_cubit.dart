import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/features/person/domain/usecases/get_user_data_usecase.dart';
import 'package:social_app/features/person/presentation/cubit/person%20cubit/setting_state.dart';

class PersonCubit extends Cubit<PersonState> {
  final GetUserDataUsecase _dataUsecase;
  PersonCubit({required GetUserDataUsecase dataUsecase})
      : _dataUsecase = dataUsecase,
        super(SettingInitial());

  Future<void> getUserData() async {
    emit(const SettingLoading());
    final result = await _dataUsecase.call();
    result.fold(
      (l) => emit(SettingFailure(errorMessage: l.errorMessage)),
      (r) => emit(SettingSuccess(userModel: r)),
    );
  }
}
