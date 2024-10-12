import 'package:firebase_auth/firebase_auth.dart';
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
  //usecases
  getIt.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(
      authRepository: getIt.call(),
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
    
  //data sources
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      firebaseAuth: getIt.call(),
      googleSignIn: getIt.call(),
    ),
  );
  //external
  getIt.registerLazySingleton(
    () => FirebaseAuth.instance,
  );
  getIt.registerLazySingleton(
    () => GoogleSignIn(),
  );
}
