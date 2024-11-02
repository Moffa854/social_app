import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/features/person/domain/usecases/upload_cover_image_usecase.dart';
import 'package:social_app/features/person/presentation/cubit/image%20cover/image_cover_state.dart';

class UlpoadeImageCoverCubit extends Cubit<UlpoadeImageCoverState> {
  final UlpoadeImageCoverUsecase _imageUsecase;
  UlpoadeImageCoverCubit({required UlpoadeImageCoverUsecase imageUsecase})
      : _imageUsecase = imageUsecase,
        super(UlpoadeImageCoverInitial());

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
          emit(UlpoadeImageCoverFailure(errorMessage: l.errorMessage));
          return null;
        },
        (r) {
          emit(UlpoadeImageCoverSuccess(success: r));
          return r;
        },
      );
    } catch (e) {
      emit(UlpoadeImageCoverFailure(errorMessage: e.toString()));
      return null;
    }
  }
}
