import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:social_app/Core/errors/fialure_server.dart';
import 'package:social_app/features/auth/data/models/auth_model.dart';
import 'package:social_app/features/person/data/datasources/remote/person_remote_data_source.dart';
import 'package:social_app/features/person/domain/repositories/person_repo.dart';

class SettingRepoImpl implements SettingRepo {
  final SettingRemoteDataSource _dataSource;

  SettingRepoImpl({required SettingRemoteDataSource dataSource})
      : _dataSource = dataSource;
  @override
  Future<Either<FialureServer, UserModel>> getUserData() {
    return _dataSource.getUserData();
  }

  @override
  Future<Either<FialureServer, void>> updateUserData(
      {required UserModel user}) async {
    return _dataSource.updateUserData(user: user);
  }

  @override
  Future<Either<FialureServer, String>> ulpoadeImage(
      {required String userId, required File file , required String path}) async {
    return await _dataSource.ulpoadeImage(userId: userId, file: file , path: path);
  }
  
  @override
  Future<Either<FialureServer, String>> ulpoadeCoverImage({required String userId, required File file, required String path})async {
    return await _dataSource.ulpoadeCoverImage(userId: userId, file: file, path: path);
  }
}