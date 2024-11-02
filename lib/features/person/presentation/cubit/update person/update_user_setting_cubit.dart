import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/features/auth/data/models/auth_model.dart';
import 'package:social_app/features/person/domain/usecases/update_userdata_usecase.dart';
import 'package:social_app/features/person/presentation/cubit/update%20person/update_user_setting_state.dart';

class UpdateUserPersonCubit extends Cubit<UpdateUserPersonState> {
  final UpdateUserdataUsecase _userdataUsecase;
  UpdateUserPersonCubit({required UpdateUserdataUsecase userdata})
      : _userdataUsecase = userdata,
        super(UpdateUserSettingInitial());

  Future<void> updateUserData({required UserModel user}) async {
    emit(const UpdateUserLoading());
    final result = await _userdataUsecase.call(user: user);
    result.fold(
      (l) => emit(UpdateUserFailure(errorMessage: l.errorMessage)),
      (r) => emit(const UpdateUserSuccess()),
    );
  }
}
