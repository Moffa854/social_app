import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_app/Core/errors/errors.dart';

abstract class AuthRepo {
  Future<Either<Failure, void>> login(String email, String password);
  Future<Either<Failure, void>> register(
    String email,
    String password,
  );
  Future<void> logout();
  Future<Either<Failure, UserCredential>> signInWithGoogle();
  Future<Either<Failure, void>> forgetPassword(String email);
}
