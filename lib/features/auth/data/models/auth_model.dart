import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String ?fristname;
    final String? lastname;
  final String email;
  final String userId;
  final String? profilePic;
  final String? coverPic;

  UserModel( {
     this.lastname,
     this.fristname,
    required this.email,
    required this.userId,
    this.profilePic,
    this.coverPic,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      lastname: json['lastname'],
      fristname: json['fristname'],
      email: json['email'],
      userId: json['userId'],
      profilePic: json['profilePic'],
      coverPic: json['coverPic'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'fristname': fristname,
      'lastname': lastname,
      'email': email,
      'userId': userId,
      'profilePic': profilePic,
      'coverPic': coverPic,
    };
  }

  factory UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    return UserModel(
      fristname: snapshot['fristname'],
      lastname: snapshot['lastname'],
      email: snapshot['email'],
      userId: snapshot['userId'],
      profilePic: snapshot['profilePic'],
      coverPic: snapshot['coverPic'],
    );
  }
}
