import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:social_app/Core/errors/fialure_server.dart';
import 'package:social_app/Core/errors/server_exception.dart';
import 'package:social_app/features/home/data/models/post_model.dart';

abstract class PostRemoteDateSource {
  Future<PostModel> addPost({required PostModel post});
  Future<List<PostModel>> getPosts();
}

class PostRemoteDateSourceImpl implements PostRemoteDateSource {
  final FirebaseFirestore _firestore;

  PostRemoteDateSourceImpl({required FirebaseFirestore firestore})
      : _firestore = firestore;
  @override
  Future<PostModel> addPost({required PostModel post}) async {
    try {
      final newPost = PostModel(
        id: post.id,
        fristName: post.fristName,
        lastName: post.lastName,
        userImage: post.userImage,
        postDate: post.postDate,
        comments: post.comments,
        description: post.description,
        likes: post.likes,
        postImage: post.postImage,
      );
      await _firestore.collection('posts').doc(post.id).set(post.toMap());
      return newPost;
    } on FirebaseException catch (e) {
      throw ServerException(errorMessage: e.message!);
    }
  }

  @override
  Future<List<PostModel>> getPosts() async {
    try {
      final postData = await _firestore.collection('posts').get();
      final List<PostModel> date = postData.docs.map((value) {
        return PostModel.toDocs(value);
      }).toList();
      return date;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
    ;
  }
}
