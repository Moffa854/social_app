import 'package:dartz/dartz.dart';
import 'package:social_app/Core/errors/fialure_server.dart';
import 'package:social_app/features/auth/data/models/auth_model.dart';
import 'package:social_app/features/person/domain/repositories/person_repo.dart';

class UpdateUserdataUsecase {
  final SettingRepo _repo;

  UpdateUserdataUsecase({required SettingRepo repo}) : _repo = repo;

  Future<Either<FialureServer, void>> call({required UserModel user}) async {
    return await _repo.updateUserData(user: user);
  }
}