import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:social_app/Config/Router/routes_name.dart';
import 'package:social_app/Core/Constant/app_colors.dart';
import 'package:social_app/Core/Constant/app_styles.dart';
import 'package:social_app/Core/Constant/app_svg.dart';
import 'package:social_app/Core/Constant/sizes_app.dart';
import 'package:social_app/Core/Extensions/Navigation/app_navigations.dart';
import 'package:social_app/Core/Widgets/build_elevated_bottom.dart';
import 'package:social_app/features/app/presentation/pages/bottom_nav_bar_app.dart';
import 'package:social_app/features/auth/data/models/auth_model.dart';
import 'package:social_app/features/auth/presentation/manager/taggel/toggle_checkbox.dart';
import 'package:social_app/features/auth/presentation/manager/taggel/toggle_cubit.dart';
import 'package:social_app/features/auth/presentation/widgets/build_text_form_feld.dart';

import '../manager/auth cubit/auth_cubit.dart';

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
          listener: (context, state) => _handleAuthState(context, state),
          builder: (context, state) {
            return Scaffold(
              body: _buildBody(context),
            );
          },
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        gradient: AppColors.scaffoldgradient,
      ),
      child: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 11),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildHeader(),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: sizesApp(context, 30, 35, 40).toDouble(),
                ),
                child: _buildForm(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Text('Ciao', style: AppStyles.gradientRegular90),
        Text('Sign in', style: AppStyles.whiteBold13.copyWith(fontSize: 18)),
      ],
    );
  }

  Widget _buildForm(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          _buildEmailField(),
          const SizedBox(height: 20),
          _buildPasswordField(context),
          const SizedBox(height: 20),
          _buildRememberAndForgotRow(context),
          const SizedBox(height: 20),
          _buildSignInButton(context),
          const SizedBox(height: 20),
          _buildSocialSignIn(context),
          const SizedBox(height: 20),
          _buildSignUpRow(context),
        ],
      ),
    );
  }

  Widget _buildEmailField() {
    return BuildTextFormField(
      controller: emailController,
      hintText: 'Email',
      validator: 'Please enter your email',
    );
  }

  Widget _buildPasswordField(BuildContext context) {
    return BlocBuilder<TogglePassword1Cubit, bool>(
      builder: (context, isVisible) {
        return BuildTextFormField(
          controller: passwordController,
          hintText: 'Password',
          validator: 'Please enter your password',
          obscureText: !isVisible,
          suffixIcon: IconButton(
            onPressed: () =>
                context.read<TogglePassword1Cubit>().togglepassword(),
            icon: Icon(
              isVisible ? Icons.visibility : Icons.visibility_off,
              color: AppColors.white,
            ),
          ),
        );
      },
    );
  }

  Widget _buildRememberAndForgotRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            BlocBuilder<CheckboxCubit, bool>(
              builder: (context, isChecked) {
                return Checkbox(
                  hoverColor: Colors.transparent,
                  side: const BorderSide(color: AppColors.white, width: 2),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  value: isChecked,
                  onChanged: (value) =>
                      context.read<CheckboxCubit>().checkBox(),
                );
              },
            ),
            Text('Remember me', style: AppStyles.whitePoppinsMedium12),
          ],
        ),
        InkWell(
          onTap: () => context.pushNamed(pageRoute: RoutesName.forgetPassword),
          child: Text(
            'Forgot password',
            style: AppStyles.whitePoppinsMedium12
                .copyWith(color: AppColors.purple),
          ),
        ),
      ],
    );
  }

  Widget _buildSignInButton(BuildContext context) {
    return BuildElevatedBottom(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          context
              .read<AuthCubit>()
              .login(emailController.text, passwordController.text);
        }
      },
      text: 'Sign in',
      width: 1.2,
    );
  }

  Widget _buildSocialSignIn(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: Text('Or sign in with', style: AppStyles.whitePoppinsMedium12),
        ),
        const SizedBox(height: 20),
        Align(
          alignment: Alignment.center,
          child: InkWell(
            onTap: () => context.read<AuthCubit>().signinWithGoogle(),
            child: SvgPicture.asset(AppSvg.google),
          ),
        ),
      ],
    );
  }

  Widget _buildSignUpRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Don’t have an account?', style: AppStyles.whitePoppinsMedium12),
        GestureDetector(
          onTap: () => context.pushNamed(pageRoute: RoutesName.logup),
          child: Text(
            'Sign up',
            style: AppStyles.whitePoppinsMedium12
                .copyWith(color: AppColors.purple),
          ),
        ),
      ],
    );
  }

  void _handleAuthState(BuildContext context, AuthState state) {
    if (state is AuthSuccess) {
      context.push(page:  BottomNavBarApp(
        
      ));
      emailController.clear();
      passwordController.clear();
    } else if (state is AuthError) {
      Fluttertoast.showToast(
        msg: 'Failed email or password',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    }
  }
}
