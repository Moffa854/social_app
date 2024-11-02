import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:social_app/Config/Router/routes_name.dart';
import 'package:social_app/Core/Extensions/Navigation/app_navigations.dart';
import 'package:social_app/features/auth/presentation/manager/auth%20cubit/auth_cubit.dart';
import 'package:social_app/features/auth/presentation/widgets/build_body.dart';

class ForgetPassword extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        _handleAuthState(context, state);
      },
      builder: (context, state) {
        return Scaffold(
          body: BuildBody(
              formKey: formKey,
              emailController: emailController,
              context: context),
        );
      },
    );
  }

  void _handleAuthState(BuildContext context, AuthState state) {
    if (state is AuthSuccess) {
      Fluttertoast.showToast(msg: 'Check your email');
      emailController.clear();
      context.pushNamedAndRemoveUntil(pageRoute: RoutesName.login);
    } else if (state is AuthError) {
      Fluttertoast.showToast(
        msg: 'Email not found',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    }
  }
}
