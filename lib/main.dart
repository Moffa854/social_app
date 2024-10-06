import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_app/Config/Router/app_routes.dart';
import 'package:social_app/Config/Router/routes_name.dart';

void main() {
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
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Social App',
          theme: ThemeData(
            useMaterial3: true,
          ),
          initialRoute: RoutesName.introduce,
          onGenerateRoute: AppRoutes.onGenerateRoute,
          onUnknownRoute: AppRoutes.onUnknownRoute,
        );
      },
    );
  }
}
