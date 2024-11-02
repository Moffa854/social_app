import 'package:device_preview/device_preview.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_app/Config/Router/app_routes.dart';
import 'package:social_app/Config/Router/routes_name.dart';
import 'package:social_app/features/auth/presentation/manager/auth%20cubit/auth_cubit.dart';
import 'package:social_app/features/chat/presentation/manager/create%20chat/create_chat_cubit.dart';
import 'package:social_app/features/chat/presentation/manager/get%20user/chat_cubit.dart';
import 'package:social_app/features/chat/presentation/manager/send%20message/send_message_cubit.dart';
import 'package:social_app/features/home/presentation/cubit/get%20posts/get_posts_cubit.dart';
import 'package:social_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:social_app/features/person/presentation/cubit/UploadeImage/ulpoade_image_cubit.dart';
import 'package:social_app/features/person/presentation/cubit/image%20cover/image_cover_cubit.dart';
import 'package:social_app/features/person/presentation/cubit/person%20cubit/setting_cubit.dart';
import 'package:social_app/features/person/presentation/cubit/update%20person/update_user_setting_cubit.dart';
import 'package:social_app/firebase_options.dart';

import 'injections.dart' as di;

void main() async {
  di.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAppCheck.instance.activate(
      webProvider: ReCaptchaV3Provider('your-recaptcha-site-key'),
      androidProvider: AndroidProvider.debug,
      appleProvider: AppleProvider.debug);
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const SocialApp(),
    ),
  );
}

class SocialApp extends StatelessWidget {
  const SocialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.getIt<SendMessageCubit>(),
        ),
        BlocProvider(
          create: (context) => di.getIt<CreatChatCubit>(),
        ),
        BlocProvider(
          create: (context) => di.getIt<ChatCubit>()..getUsers(),
        ),
        BlocProvider(
          create: (context) => di.getIt<AuthCubit>(),
        ),
        BlocProvider(
          create: (context) => di.getIt<PersonCubit>()..getUserData(),
        ),
        BlocProvider(
          create: (context) => di.getIt<UlpoadeImageProfileCubit>(),
        ),
        BlocProvider(
          create: (context) => di.getIt<UlpoadeImageCoverCubit>(),
        ),
        BlocProvider(
          create: (context) => di.getIt<UpdateUserPersonCubit>(),
        ),
        BlocProvider(
          create: (context) => di.getIt<HomeCubit>(),
        ),
        BlocProvider(
          create: (context) => di.getIt<GetPostsCubit>()..getPosts(),
        ),
      ],
      child: ScreenUtilInit(
          designSize: const Size(390, 844),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Social App',
              themeMode: ThemeMode.dark,
              theme: ThemeData(
                useMaterial3: true,
              ),
              initialRoute: RoutesName.logup,
              onGenerateRoute: AppRoutes.onGenerateRoute,
              onUnknownRoute: AppRoutes.onUnknownRoute,
            );
          }),
    );
  }
}
