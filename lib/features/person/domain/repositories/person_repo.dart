import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:social_app/Core/errors/fialure_server.dart';
import 'package:social_app/features/auth/data/models/auth_model.dart';


abstract class SettingRepo {
  Future<Either<FialureServer, UserModel>> getUserData();
  Future<Either<FialureServer, void>> updateUserData({required UserModel user});
  Future<Either<FialureServer, String>> ulpoadeImage({
    required String userId,
    required File file,
    required String path,
  });
    Future<Either<FialureServer, String>> ulpoadeCoverImage({
    required String userId,
    required File file,
    required String path,
  });
}