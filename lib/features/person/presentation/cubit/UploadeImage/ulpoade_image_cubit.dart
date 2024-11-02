import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/features/person/domain/usecases/ulpoade_image_usecase.dart';
import 'package:social_app/features/person/presentation/cubit/UploadeImage/ulpoade_image_state.dart';

class UlpoadeImageProfileCubit extends Cubit<UlpoadeImageProfileState> {
  final UlpoadeImageUsecase _imageUsecase;
  UlpoadeImageProfileCubit({required UlpoadeImageUsecase imageUsecase})
      : _imageUsecase = imageUsecase,
        super(UlpoadeImageInitial());

  Future<String?> ulpoadImage(
      {required String userId,
      required File file,
      required String path}) async {
    final result = await _imageUsecase.call(
      userId: userId,
      file: file,
      path: path,
    );
    try {
      return result.fold(
        (l) {
          emit(UlpoadeImageFailure(errorMessage: l.errorMessage));
          return null;
        },
        (r) {
          emit(UlpoadeImageSuccess(success: r));
          return r;
        },
      );
    } catch (e) {
      emit(UlpoadeImageFailure(errorMessage: e.toString()));
      return null;
    }
  }
}
