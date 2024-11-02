import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:social_app/Core/errors/errors.dart';
import 'package:social_app/features/auth/data/models/auth_model.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failure, void>> login(String email, String password);
  Future<Either<Failure, void>> register(
    String email,
    String password,
    String fristname,
    String lastname,
  );
  Future<Either<Failure, void>> logout();
  Future<Either<Failure, UserCredential>> signInWithGoogle();
  Future<Either<Failure, void>> forgetPassword(String email);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final FirebaseFirestore? _firestore;
  AuthRemoteDataSourceImpl({
    required FirebaseAuth firebaseAuth,
    required GoogleSignIn googleSignIn,
    required FirebaseFirestore firestore,
  })  : _firebaseAuth = firebaseAuth,
        _firestore = firestore,
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
    String fristname,
    String lastname,
  ) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      final user = UserModel(
        coverPic: 'https://images.pexels.com/photos/2034373/pexels-photo-2034373.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        profilePic: 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png',
        lastname: lastname,
        fristname: fristname,
        email: userCredential.user!.email!,
        userId: userCredential.user!.uid,
      );
      await _firestore!.collection('users').doc(userCredential.user!.email).set(
            user.toMap(),
          );
      return Right(userCredential);
    } on FirebaseAuthException catch (e) {
      return Left((ServerFailure()));
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
      final user = UserModel(
        fristname: googleUser!.displayName!,
        email: googleUser.email,
        userId: googleUser.id,
        profilePic: 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png',
        coverPic: 'https://images.pexels.com/photos/2034373/pexels-photo-2034373.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      );
                                                                                                   
      await _firestore!.collection('users').doc(googleUser.email).set(
            user.toMap(),
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
