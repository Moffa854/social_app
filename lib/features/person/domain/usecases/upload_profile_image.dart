import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_app/Core/errors/errors.dart';
import 'package:social_app/features/person/domain/repositories/person_repo.dart';

class UploadProfileImageUseCase {
  final PersonRepo _personRepo;

  UploadProfileImageUseCase({required PersonRepo personRepo})
      : _personRepo = personRepo;

  Future<Either<Failure, String>> call(String userId, XFile imageFile) async {
    return await _personRepo.uploadProfileImage(userId, imageFile);
  }
}