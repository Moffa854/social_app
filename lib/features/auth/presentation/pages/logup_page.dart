import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:social_app/Config/Router/routes_name.dart';
import 'package:social_app/Core/Constant/app_colors.dart';
import 'package:social_app/Core/Extensions/Navigation/app_navigations.dart';
import 'package:social_app/features/app/presentation/pages/bottom_nav_bar_app.dart';
import 'package:social_app/features/auth/presentation/cubit/auth_cubit/cubit/auth_cubit.dart';
import 'package:social_app/features/auth/presentation/cubit/taggel/toggle_checkbox.dart';
import 'package:social_app/features/auth/presentation/cubit/taggel/toggle_choose_gender.dart';
import 'package:social_app/features/auth/presentation/cubit/taggel/toggle_password2_cubit.dart';
import 'package:social_app/features/auth/presentation/cubit/taggel/toggle_password3_cubit.dart';
import 'package:social_app/features/auth/presentation/widgets/build_sign_up_form.dart';

class LogupPage extends StatelessWidget {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  LogupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        handleAuthState(context, state);
      },
      builder: (context, state) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => ToggleChooseGender()),
            BlocProvider(create: (context) => CheckboxCubit()),
            BlocProvider(create: (context) => TogglePassword2Cubit()),
            BlocProvider(create: (context) => TogglePassword3Cubit()),
          ],
          child: Scaffold(
            body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                gradient: AppColors.scaffoldgradient,
              ),
              child: BuildSignUpForm(
                formKey: formKey,
                firstNameController: firstNameController,
                lastNameController: lastNameController,
                emailController: emailController,
                passwordController: passwordController,
                confirmPasswordController: confirmPasswordController,
                context: context,
              ),
            ),
          ),
        );
      },
    );
  }

  void handleAuthState(BuildContext context, AuthState state) {
    if (state is Homesuccess) {
      context.push(page: BottomNavBarApp(
        firstname: firstNameController.text,
        lastname: lastNameController.text,


      ));
    } else if (state is HomeError) {
      Fluttertoast.showToast(
        msg: 'An unexpected error occurred.',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    }
  }
}
