class MessageModel {
  final String sendId;
  final String message;
  final DateTime timeSpam;

  MessageModel({
    required this.sendId,
    required this.message,
    required this.timeSpam,
  });
  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      sendId: json['sendId'],
      message: json['message'],
      timeSpam: DateTime.fromMillisecondsSinceEpoch(json['timeSpam']),
    );
  }
  Map <String , dynamic> tojson(){
    return <String , dynamic>{
      'sendId': sendId,
      'message': message,
      'timeSpam': timeSpam.millisecondsSinceEpoch,
    };
  }
}
