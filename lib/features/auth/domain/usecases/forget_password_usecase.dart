import 'package:dartz/dartz.dart';
import 'package:social_app/Core/errors/errors.dart';
import 'package:social_app/features/auth/domain/repositories/auth_repo.dart';

class ForgetPasswordUsecase{
  final AuthRepo authRepository;
  ForgetPasswordUsecase({required this.authRepository});
  Future<Either<Failure, void>> call(String email) async {
    return await authRepository.forgetPassword(email);
  }
  
}