import 'package:dartz/dartz.dart';
import 'package:social_app/Core/errors/fialure_server.dart';
import 'package:social_app/features/auth/data/models/auth_model.dart';
import 'package:social_app/features/person/domain/repositories/person_repo.dart';

class GetUserDataUsecase {
  final SettingRepo _repo;

  GetUserDataUsecase({required SettingRepo repo}) : _repo = repo;

  Future<Either<FialureServer, UserModel>> call() async {
    return await _repo.getUserData();
  }
}