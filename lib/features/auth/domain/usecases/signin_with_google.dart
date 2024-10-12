import 'package:dartz/dartz.dart';
import 'package:social_app/Core/errors/errors.dart';
import 'package:social_app/features/auth/domain/repositories/auth_repo.dart';

class SigninWithGoogleUseCase {
  final AuthRepo _authRepository;

  SigninWithGoogleUseCase({required AuthRepo authRepository})
      : _authRepository = authRepository;
  Future<Either<Failure, void>> call() async {
    return await _authRepository.signInWithGoogle();
  }
}
