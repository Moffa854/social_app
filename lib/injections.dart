import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:social_app/features/auth/data/datasources/remote/auth_remote_data_source.dart';
import 'package:social_app/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:social_app/features/auth/domain/repositories/auth_repo.dart';
import 'package:social_app/features/auth/domain/usecases/forget_password_usecase.dart';
import 'package:social_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:social_app/features/auth/domain/usecases/logout_usecase.dart';
import 'package:social_app/features/auth/domain/usecases/signin_with_google.dart';
import 'package:social_app/features/auth/domain/usecases/signup_usecase.dart';
import 'package:social_app/features/auth/presentation/cubit/auth_cubit/cubit/auth_cubit.dart';
import 'package:social_app/features/person/data/datasources/remote/person_remote_data_source.dart';
import 'package:social_app/features/person/data/repositories/person_repo_impl.dart';
import 'package:social_app/features/person/domain/repositories/person_repo.dart';
import 'package:social_app/features/person/domain/usecases/upload_cover_image.dart';
import 'package:social_app/features/person/domain/usecases/get_person_usecase.dart';
import 'package:social_app/features/person/domain/usecases/upload_profile_image.dart';
import 'package:social_app/features/person/presentation/cubit/person_cubit.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  //cubit
  getIt.registerFactory<AuthCubit>(
    () => AuthCubit(
      loginUseCase: getIt.call(),
      forgetPasswordusecase: getIt.call(),
      logoutUseCase: getIt.call(),
      signinWithGoogleUseCase: getIt.call(),
      signupUseCase: getIt.call(),
    ),
  );
  // getIt.registerFactory<PersonCubit>(
  //   () => PersonCubit(
  //     getPersonUsecase: getIt.call(),
  //     uploadCoverImageUsecase: getIt.call(),
  //     uploadProfileImageUsecase: getIt.call(),
  //   ),
  // );
  //usecases
  getIt.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(
      authRepository: getIt.call(),
    ),
  );
  getIt.registerLazySingleton<UploadCoverImageusecase>(
    () => UploadCoverImageusecase(
      personRepo: getIt.call(),
    ),
  );
  getIt.registerLazySingleton<GetPersonUsecase>(
    () => GetPersonUsecase(
      personRepo: getIt.call(),
    ),
  );
  getIt.registerLazySingleton<UploadProfileImageUseCase>(
    () => UploadProfileImageUseCase(
      personRepo: getIt.call(),
    ),
  );
  getIt.registerLazySingleton<ForgetPasswordUsecase>(
    () => ForgetPasswordUsecase(
      authRepository: getIt.call(),
    ),
  );
  getIt.registerLazySingleton<LogoutUsecase>(
    () => LogoutUsecase(
      authRepository: getIt.call(),
    ),
  );
  getIt.registerLazySingleton<SigninWithGoogleUseCase>(
    () => SigninWithGoogleUseCase(
      authRepository: getIt.call(),
    ),
  );
  getIt.registerLazySingleton<SignupUsecase>(
    () => SignupUsecase(
      authRepository: getIt.call(),
    ),
  );
  //repository
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(
      authRemoteDataSource: getIt.call(),
    ),
  );
  getIt.registerLazySingleton<PersonRepo>(
    () => PersonRepoImpl(
      remoteDataSource: getIt.call(),
    )
  );
  //data sources
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      firebaseAuth: getIt.call(),
      googleSignIn: getIt.call(),
    ),
  );
  getIt.registerLazySingleton<PersonRemoteDataSource>(
    () => PersonRemoteDataSourceImpl(
      firestore: getIt.call(),
      storage: getIt.call(),
    ),
  );
  //external
  getIt.registerLazySingleton(
    () => FirebaseAuth.instance,
  );
  getIt.registerLazySingleton(
    () => GoogleSignIn(),
  );
  getIt.registerLazySingleton(
    () => FirebaseFirestore.instance,
  );
  getIt.registerLazySingleton(
    () => FirebaseStorage.instance,
  );
}
