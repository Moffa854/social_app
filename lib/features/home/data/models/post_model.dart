import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  final String id;
  final String fristName;
  final String lastName;
  final String description;
  final String userImage;
  final DateTime postDate;
  final List<dynamic>? likes;
  final List<dynamic>? comments;
  final String? postImage;

  PostModel({
    required this.id,
    required this.fristName,
    required this.lastName,
    this.description = '',
    required this.userImage,
    required this.postDate,
    this.likes,
    this.comments,
    this.postImage,
  });
  factory PostModel.toDocs(DocumentSnapshot snapshot) {
    return PostModel(
      id: snapshot.get('id'),
      fristName: snapshot.get('fristName'),
      lastName: snapshot.get('lastName'),
      description: snapshot.get('description'),
      userImage: snapshot.get('userImage'),
      postDate: (snapshot.get('postDate') as Timestamp).toDate(),
      likes: snapshot.get('likes'),
      comments: snapshot.get('comments'),
      postImage: snapshot.get(
        'postImage',
      ),
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fristName': fristName,
      'lastName': lastName,
      'description': description,
      'userImage': userImage,
      'postDate': postDate,
      'likes': likes,
      'comments': comments,
      'postImage': postImage,
    };
  }
}
