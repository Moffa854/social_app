import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:social_app/Core/errors/fialure_server.dart';
import 'package:social_app/Core/errors/server_exception.dart';
import 'package:social_app/features/auth/data/models/auth_model.dart';

abstract class SettingRemoteDataSource {
  Future<Either<FialureServer, UserModel>> getUserData();
  Future<Either<FialureServer, void>> updateUserData({required UserModel user});
  Future<Either<FialureServer, String>> ulpoadeImage(
      {required String userId, required File file, required String path});
  Future<Either<FialureServer, String>> ulpoadeCoverImage({
    required String userId,
    required File file,
    required String path,
  });
}

class SettingRemoteDataSourceImpl implements SettingRemoteDataSource {
  final FirebaseFirestore _firestore;
  final FirebaseStorage _storage;
  final FirebaseAuth _auth;

  SettingRemoteDataSourceImpl({
    required FirebaseFirestore firestore,
    required FirebaseStorage storage,
    required FirebaseAuth auth,
  })  : _firestore = firestore,
        _storage = storage,
        _auth = auth;
  @override
  Future<Either<FialureServer, UserModel>> getUserData() async {
    try {
      final userData = await _firestore
          .collection('users')
          .doc(_auth.currentUser!.email!)
          .get();
      return Right(UserModel.fromSnapshot(userData));
    } catch (e) {
      return Left(FialureServer());
    }
  }

  @override
  Future<Either<FialureServer, void>> updateUserData(
      {required UserModel user}) async {
    try {
      final data = await _firestore.collection('users').doc(user.email).update(
            user.toMap(),
          );
      return Right(data);
    } catch (e) {
      return Left(FialureServer());
    }
  }

  @override
  Future<Either<FialureServer, String>> ulpoadeImage({
    required String userId,
    required File file,
    required String path,
  }) async {
    try {
      final image =
          await _storage.ref().child(path).child(userId).putFile(file);
      final url = await image.ref.getDownloadURL();
      return Right(url);
    } on ServerException catch (e) {
      return Left(FialureServer());
    }
  }

  @override
  Future<Either<FialureServer, String>> ulpoadeCoverImage({
    required String userId,
    required File file,
    required String path,
  }) async {
    try {
      final image =
          await _storage.ref().child(path).child(userId).putFile(file);
      final url = await image.ref.getDownloadURL();
      return Right(url);
    } on ServerException catch (e) {
      return Left(FialureServer());
    }
  }
}
