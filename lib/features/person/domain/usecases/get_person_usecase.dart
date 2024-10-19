import 'package:dartz/dartz.dart';
import 'package:social_app/Core/errors/errors.dart';
import 'package:social_app/features/person/domain/repositories/person_repo.dart';

class GetPersonUsecase {
  final PersonRepo _personRepo;

  GetPersonUsecase({required PersonRepo personRepo}) : _personRepo = personRepo;

  Future<Either<Failure, Map<String, dynamic>>> call(String userId) async {
    return await _personRepo.getUserData(userId);
  }
}
