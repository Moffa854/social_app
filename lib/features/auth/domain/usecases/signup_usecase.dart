import 'package:dartz/dartz.dart';
import 'package:social_app/Core/errors/errors.dart';
import 'package:social_app/features/auth/domain/repositories/auth_repo.dart';

class SignupUsecase {
  final AuthRepo authRepository;

  SignupUsecase({required this.authRepository});
  Future<Either<Failure, void>> call(String email, String password ,String fristname, String lastname,) async {
    return await authRepository.register(email, password, fristname, lastname, );
  }
}
