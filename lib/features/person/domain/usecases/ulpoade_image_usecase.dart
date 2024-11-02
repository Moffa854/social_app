import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:social_app/Core/errors/fialure_server.dart';
import 'package:social_app/features/person/domain/repositories/person_repo.dart';

class UlpoadeImageUsecase {
  final SettingRepo _repo;

  UlpoadeImageUsecase({required SettingRepo repo}) : _repo = repo;

  Future<Either<FialureServer, String>> call(
      {required String userId,
      required File file,
      required String path}) async {
    return await _repo.ulpoadeImage(userId: userId, file: file, path: path);
  }
}