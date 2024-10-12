import 'package:dartz/dartz.dart';
import 'package:social_app/Core/errors/errors.dart';
import 'package:social_app/features/auth/domain/repositories/auth_repo.dart';

class LoginUseCase {
  final AuthRepo authRepository;

  LoginUseCase({required this.authRepository});

  Future<Either<Failure, void>> call(String email, String password) async {
    return await authRepository.login(email, password);
  }
}
