import 'package:social_app/features/chat/data/models/message_model.dart';

class ChatModel {
  final String chatId;
  final List<String> members;
  final MessageModel lastMessage;
  final DateTime lastUpdate;

  ChatModel({
    required this.chatId,
    required this.members,
    required this.lastMessage,
    required this.lastUpdate,
  });
  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      chatId: json['chatId'] as String,
      members: List<String>.from(json['members'] as List<String>),
      lastMessage: MessageModel.fromJson(json['lastMessage']as Map<String, dynamic>),
      lastUpdate: DateTime.fromMillisecondsSinceEpoch(json['lastUpdate']as int),
    );
  }

  Map<String,dynamic> tojson(){
    return {
      'chatId': chatId,
      'members': members,
      'lastMessage': lastMessage.tojson(),
      'lastUpdate': lastUpdate.millisecondsSinceEpoch,
    };
  }
}
