import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:social_app/Core/errors/errors.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failure, void>> login(String email, String password);
  Future<Either<Failure, void>> register(
    String email,
    String password,
  );
  Future<Either<Failure, void>> logout();
  Future<Either<Failure, UserCredential>> signInWithGoogle();
  Future<Either<Failure, void>> forgetPassword(String email);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  AuthRemoteDataSourceImpl({
    required FirebaseAuth firebaseAuth,
    required GoogleSignIn googleSignIn,
  })  : _firebaseAuth = firebaseAuth,
        _googleSignIn = googleSignIn;

  @override
  Future<Either<Failure, void>> login(String email, String password) async {
    try {
      final userCredential1 = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(userCredential1);
    } on FirebaseAuthException catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> register(
    String email,
    String password,
  ) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      return Right(userCredential);
    } on FirebaseAuthException catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      final re = await _firebaseAuth.signOut();
      return Right(re);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, UserCredential>> signInWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      await googleSignIn.signOut();
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);
      return Right(userCredential);
    } on FirebaseAuthException catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> forgetPassword(String email) async {
    try {
      final forget = await _firebaseAuth.sendPasswordResetEmail(
        email: email,
      );
      return Right(forget);
    } on FirebaseAuthException catch (e) {
      return Left(ServerFailure());
    }
  }
}
