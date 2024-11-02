import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_app/Core/errors/errors.dart';
import 'package:social_app/features/auth/data/datasources/remote/auth_remote_data_source.dart';
import 'package:social_app/features/auth/domain/repositories/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepoImpl({required AuthRemoteDataSource authRemoteDataSource})
      : _authRemoteDataSource = authRemoteDataSource;
  @override
  Future<Either<Failure, void>> login(String email, String password) async {
    return await _authRemoteDataSource.login(email, password);
  }
  @override
  Future<Either<Failure, void>> register(
    String email,
    String password,
    String fristname,
    String lastname,
  ) async {
    return await _authRemoteDataSource.register(email, password,fristname,lastname, );
  }

  @override
  Future<Either<Failure, UserCredential>> signInWithGoogle() async {
    return await _authRemoteDataSource.signInWithGoogle();
  }

  @override
  Future<Either<Failure, void>> logout() async {
    return await _authRemoteDataSource.logout();
  }
  
  @override
  Future<Either<Failure, void>> forgetPassword(String email) async{
    return await _authRemoteDataSource.forgetPassword(email);
  }
}
