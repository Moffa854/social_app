import 'package:social_app/features/auth/domain/repositories/auth_repo.dart';

class LogoutUsecase {
  final AuthRepo authRepository;

  LogoutUsecase({required this.authRepository});
  Future<void> call() async {
    return await authRepository.logout();
  }
}
