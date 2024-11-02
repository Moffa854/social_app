import 'package:social_app/features/chat/data/models/message_model.dart';
import 'package:social_app/features/chat/domain/repositories/chat_repo.dart';

class GetMessageUsecase {
  final ChatRepo _chatRepo;

  GetMessageUsecase({required ChatRepo chatRepo}) : _chatRepo = chatRepo;

  Stream<List<MessageModel>> call({required String chatId}) {
    return _chatRepo.getMessages(chatId: chatId);
  }
}