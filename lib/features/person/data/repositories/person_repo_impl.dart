
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_app/Core/errors/errors.dart';
import 'package:social_app/features/person/data/datasources/remote/person_remote_data_source.dart';
import 'package:social_app/features/person/domain/repositories/person_repo.dart';

class PersonRepoImpl implements PersonRepo {
  final PersonRemoteDataSource _remoteDataSource;

  PersonRepoImpl({required PersonRemoteDataSource remoteDataSource,})
      : _remoteDataSource = remoteDataSource;
  @override
  Future<Either<Failure, Map<String, dynamic>>> getUserData(
      String userId) async {
    return await _remoteDataSource.getUserData(userId);
  }

  @override
  Future<Either<Failure, String>> uploadCoverImage(
      String userId, XFile imageFile) async {
    return await _remoteDataSource.uploadCoverImage(userId, imageFile);
  }

  @override
  Future<Either<Failure, String>> uploadProfileImage(
      String userId, XFile imageFile) async {
    return await _remoteDataSource.uploadProfileImage(userId, imageFile);
  }
}
