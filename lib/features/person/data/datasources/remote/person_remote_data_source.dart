import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_app/Core/errors/errors.dart';

abstract class PersonRemoteDataSource {
  Future<Either<Failure, Map<String, dynamic>>> getUserData(String userId);
  Future<Either<Failure, String>> uploadProfileImage(
      String userId, XFile imageFile);
  Future<Either<Failure, String>> uploadCoverImage(
      String userId, XFile imageFile);
}

class PersonRemoteDataSourceImpl implements PersonRemoteDataSource {
  final FirebaseFirestore _firestore;
  final FirebaseStorage _storage;

  PersonRemoteDataSourceImpl({
    required FirebaseFirestore firestore,
    required FirebaseStorage storage,
  })  : _firestore = firestore,
        _storage = storage;

  @override
  Future<Either<Failure, Map<String, dynamic>>> getUserData(
      String userId) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
          await _firestore.collection('users').doc(userId).get();
      Map<String, dynamic> data = documentSnapshot.data() ?? {};
      return Right(data);
    } on FirebaseException catch (e) {
      return Left(ServerFailure());
    }
  }

@override
Future<Either<Failure, String>> uploadCoverImage(
    String userId, XFile imageFile) async {
  try {
    // Check if the user document exists
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await _firestore.collection('users').doc(userId).get();

    if (!documentSnapshot.exists) {
      // Create a new document if it doesn't exist
      await _firestore.collection('users').doc(userId).set({
        'coverImage': '',
        // Add other default fields as necessary
      });
    }

    Reference reference =
        _storage.ref().child('users').child(userId).child('coverphoto');
    UploadTask uploadTask = reference.putFile(File(imageFile.path));
    TaskSnapshot taskSnapshot = await uploadTask;
    String imageUrl = await taskSnapshot.ref.getDownloadURL();

    // Update Firestore with the new cover image URL
    await _firestore.collection('users').doc(userId).update({
      'coverImage': imageUrl,
    });

    return Right(imageUrl);
  } on FirebaseException catch (e) {
    return Left(ServerFailure());
  }
}


  @override
  Future<Either<Failure, String>> uploadProfileImage(
      String userId, XFile imageFile) async {
    try {
      Reference reference =
          _storage.ref().child('users').child(userId).child('profilephoto');
      UploadTask uploadTask = reference.putFile(File(imageFile.path));
      TaskSnapshot taskSnapshot = await uploadTask;
      String imageUrl = await taskSnapshot.ref.getDownloadURL();
      return Right(imageUrl);
    } on FirebaseException catch (e) {
      return Left(ServerFailure());
    }
  }
}
