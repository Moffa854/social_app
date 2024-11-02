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
import 'package:social_app/features/auth/presentation/manager/auth%20cubit/auth_cubit.dart';
import 'package:social_app/features/chat/data/datasources/remote/chat_remote_date_sourse.dart';
import 'package:social_app/features/chat/data/repositories/chat_repo_impl.dart';
import 'package:social_app/features/chat/domain/repositories/chat_repo.dart';
import 'package:social_app/features/chat/domain/usecases/create_or_get_chat_usecase.dart';
import 'package:social_app/features/chat/domain/usecases/get_messages_usecase.dart';
import 'package:social_app/features/chat/domain/usecases/get_users_usecase.dart';
import 'package:social_app/features/chat/domain/usecases/send_message_usecase.dart';
import 'package:social_app/features/chat/presentation/manager/create%20chat/create_chat_cubit.dart';
import 'package:social_app/features/chat/presentation/manager/get%20user/chat_cubit.dart';
import 'package:social_app/features/chat/presentation/manager/send%20message/send_message_cubit.dart';
import 'package:social_app/features/home/data/datasources/remote/post_remote_date_source.dart';
import 'package:social_app/features/home/data/repositories/post_repo_impl.dart';
import 'package:social_app/features/home/domain/repositories/post_repo.dart';
import 'package:social_app/features/home/domain/usecases/add_post_usecase.dart';
import 'package:social_app/features/home/domain/usecases/get_post_usecase.dart';
import 'package:social_app/features/home/presentation/cubit/get%20posts/get_posts_cubit.dart';
import 'package:social_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:social_app/features/person/data/datasources/remote/person_remote_data_source.dart';
import 'package:social_app/features/person/data/repositories/person_repo_impl.dart';
import 'package:social_app/features/person/domain/repositories/person_repo.dart';
import 'package:social_app/features/person/domain/usecases/get_user_data_usecase.dart';
import 'package:social_app/features/person/domain/usecases/ulpoade_image_usecase.dart';
import 'package:social_app/features/person/domain/usecases/update_userdata_usecase.dart';
import 'package:social_app/features/person/domain/usecases/upload_cover_image_usecase.dart';
import 'package:social_app/features/person/presentation/cubit/UploadeImage/ulpoade_image_cubit.dart';
import 'package:social_app/features/person/presentation/cubit/image%20cover/image_cover_cubit.dart';
import 'package:social_app/features/person/presentation/cubit/person%20cubit/setting_cubit.dart';
import 'package:social_app/features/person/presentation/cubit/update%20person/update_user_setting_cubit.dart';

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
  getIt.registerFactory<ChatCubit>(
    () => ChatCubit(
      getStreamUserUsecase: getIt.call(),
    ),
  );
  getIt.registerFactory<SendMessageCubit>(
    () => SendMessageCubit(
      messageUsecase: getIt.call(),
    ),
  );
  getIt.registerFactory<CreatChatCubit>(
    () => CreatChatCubit(
      createOrGetchatUsecase: getIt.call(),
      messageUsecase: getIt.call(),
    ),
  );
  getIt.registerFactory<HomeCubit>(
    () => HomeCubit(
      addPostUsecase: getIt.call(),
    ),
  );
  getIt.registerFactory<GetPostsCubit>(
    () => GetPostsCubit(
      getPostUsecase: getIt.call(),
    ),
  );
  getIt.registerFactory<PersonCubit>(
    () => PersonCubit(
      dataUsecase: getIt.call(),
    ),
  );
  getIt.registerFactory<UpdateUserPersonCubit>(
    () => UpdateUserPersonCubit(
      userdata: getIt.call(),
    ),
  );
  getIt.registerFactory<UlpoadeImageProfileCubit>(
    () => UlpoadeImageProfileCubit(
      imageUsecase: getIt.call(),
    ),
  );
  getIt.registerFactory<UlpoadeImageCoverCubit>(
    () => UlpoadeImageCoverCubit(
      imageUsecase: getIt.call(),
    ),
  );
  //usecases
  getIt.registerLazySingleton<SendMessageUsecase>(
    () => SendMessageUsecase(
      chatRepo: getIt.call(),
    ),
  );
  getIt.registerLazySingleton<CreateOrGetchatUsecase>(
    () => CreateOrGetchatUsecase(
      chatRepo: getIt.call(),
    ),
  );
  getIt.registerLazySingleton<GetMessageUsecase>(
    () => GetMessageUsecase(
      chatRepo: getIt.call(),
    ),
  );
  getIt.registerLazySingleton<GetUserUsecase>(
    () => GetUserUsecase(
      chatRepo: getIt.call(),
    ),
  );
  getIt.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(
      authRepository: getIt.call(),
    ),
  );
  getIt.registerLazySingleton<AddPostUsecase>(() => AddPostUsecase(
        postRepo: getIt.call(),
      ));
  getIt.registerLazySingleton<GetPostUsecase>(() => GetPostUsecase(
        postRepo: getIt.call(),
      ));
  getIt.registerLazySingleton<UpdateUserdataUsecase>(
    () => UpdateUserdataUsecase(
      repo: getIt.call(),
    ),
  );
  getIt.registerLazySingleton<GetUserDataUsecase>(
    () => GetUserDataUsecase(
      repo: getIt.call(),
    ),
  );
  getIt.registerLazySingleton<UlpoadeImageUsecase>(
    () => UlpoadeImageUsecase(
      repo: getIt.call(),
    ),
  );
  getIt.registerLazySingleton<UlpoadeImageCoverUsecase>(
    () => UlpoadeImageCoverUsecase(
      repo: getIt.call(),
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
  getIt.registerLazySingleton<ChatRepo>(
    () => ChatRepoImpl(
      chatRemoteDataSource: getIt.call(),
    ),
  );
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(
      authRemoteDataSource: getIt.call(),
    ),
  );
  getIt.registerLazySingleton<PostRepo>(
    () => PostRepoImpl(
      postRemoteDateSource: getIt.call(),
    ),
  );
  getIt.registerLazySingleton<SettingRepo>(
    () => SettingRepoImpl(
      dataSource: getIt.call(),
    ),
  );
  //data sources
  getIt.registerLazySingleton<ChatRemoteDataSource>(
    () => ChatRemoteDataSourceImpl(
      firestore: getIt.call(),
    ),
  );
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      firebaseAuth: getIt.call(),
      firestore: getIt.call(),
      googleSignIn: getIt.call(),
    ),
  );
  getIt.registerLazySingleton<PostRemoteDateSource>(
    () => PostRemoteDateSourceImpl(
      firestore: getIt.call(),
    ),
  );
  getIt.registerLazySingleton<SettingRemoteDataSource>(
    () => SettingRemoteDataSourceImpl(
      auth: getIt.call(),
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
