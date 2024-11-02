import 'package:social_app/features/auth/data/models/auth_model.dart';
import 'package:social_app/features/chat/domain/repositories/chat_repo.dart';

class GetUserUsecase {
  final ChatRepo _chatRepo;

  GetUserUsecase({required ChatRepo chatRepo}) : _chatRepo = chatRepo;

  Stream<List<UserModel>> call() {
    return _chatRepo.getUsers();
  }
}