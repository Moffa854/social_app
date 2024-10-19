import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_app/Core/errors/errors.dart';
abstract class PersonRepo {
Future<Either<Failure, Map<String, dynamic>>> getUserData(String userId);
  Future<Either<Failure, String>> uploadProfileImage(String userId, XFile imageFile);
  Future<Either<Failure, String>> uploadCoverImage(String userId, XFile imageFile);  
}
