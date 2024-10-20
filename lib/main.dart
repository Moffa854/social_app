import 'package:device_preview/device_preview.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Config/Router/app_routes.dart';
import 'package:social_app/Config/Router/routes_name.dart';
import 'package:social_app/features/auth/presentation/cubit/auth_cubit/cubit/auth_cubit.dart';
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
        BlocProvider(create: (context) => di.getIt<AuthCubit>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Social App',
        theme: ThemeData(
          useMaterial3: true,
        ),
        initialRoute: RoutesName.logup,
        onGenerateRoute: AppRoutes.onGenerateRoute,
        onUnknownRoute: AppRoutes.onUnknownRoute,
      ),
    );
  }
}
