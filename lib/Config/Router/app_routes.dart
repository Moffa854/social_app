import 'package:flutter/material.dart';
import 'package:social_app/Config/Router/create_slide_transation.dart';
import 'package:social_app/Config/Router/routes_name.dart';
import 'package:social_app/features/Introduce/presentation/pages/introduce_page.dart';
import 'package:social_app/features/app/presentation/pages/bottom_nav_bar_app.dart';
import 'package:social_app/features/auth/presentation/pages/forget_password.dart';
import 'package:social_app/features/auth/presentation/pages/login_page.dart';
import 'package:social_app/features/auth/presentation/pages/logup_page.dart';
import 'package:social_app/features/home/presentation/pages/home_page.dart';

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.introduce:
        return createSlideTransation(
          const IntroducePage(),
          const Offset(1.0, 0.1),
        );
      case RoutesName.login:
        return createSlideTransation(
          LoginPage(),
          const Offset(0.1, 1.0),
        );
      case RoutesName.logup:
        return createSlideTransation(
          LogupPage(),
          const Offset(0.1, 1.0),
        );
        case RoutesName.forgetPassword:
        return createSlideTransation(
           ForgetPassword(),
          const Offset(0.1, 1.0),
        );
      case RoutesName.home:
        return createSlideTransation(
          const HomePage(),
          const Offset(0.1, 1.0),
        );
         case RoutesName.app:
        return createSlideTransation(
           BottomNavBarApp(),
          const Offset(0.1, 1.0),
        );
      default:
        return onUnknownRoute(settings);
    }
  }

  static Route<dynamic> onUnknownRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) {
        return Scaffold(
          body: Center(
            child: Text(
              'No route defined for ${settings.name}',
              style: const TextStyle(
                color: Colors.red,
              ),
            ),
          ),
        );
      },
    );
  }
}
