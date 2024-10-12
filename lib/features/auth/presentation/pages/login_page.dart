import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:social_app/Config/Router/routes_name.dart';
import 'package:social_app/Core/Extensions/Navigation/app_navigations.dart';
import 'package:social_app/features/auth/presentation/cubit/auth_cubit/cubit/auth_cubit.dart';
import 'package:social_app/features/auth/presentation/cubit/taggel/toggle_checkbox.dart';
import 'package:social_app/features/auth/presentation/cubit/taggel/toggle_cubit.dart';
import 'package:social_app/features/auth/presentation/widgets/build_login_form.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckboxCubit(),
      child: BlocProvider(
        create: (context) => TogglePassword1Cubit(),
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            _handleAuthState(context, state);
          },
          builder: (context, state) {
            return Scaffold(
              body: BuildLoginForm(
                  formKey: formKey,
                  emailController: emailController,
                  passwordController: passwordController,
                  context: context),
            );
          },
        ),
      ),
    );
  }

  void _handleAuthState(BuildContext context, AuthState state) {
    if (state is Homesuccess) {
      context.pushNamed(pageRoute: RoutesName.app);
    } else if (state is HomeError) {
      Fluttertoast.showToast(
        msg: 'Failed email or password',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    }
  }
}
