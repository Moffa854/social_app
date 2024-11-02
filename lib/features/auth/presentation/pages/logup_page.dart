import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:social_app/Core/Constant/app_colors.dart';
import 'package:social_app/Core/Constant/app_styles.dart';
import 'package:social_app/Core/Constant/sizes_app.dart';
import 'package:social_app/Core/Extensions/Navigation/app_navigations.dart';
import 'package:social_app/Core/Widgets/build_elevated_bottom.dart';
import 'package:social_app/features/app/presentation/pages/bottom_nav_bar_app.dart';
import 'package:social_app/features/auth/presentation/manager/auth%20cubit/auth_cubit.dart';
import 'package:social_app/features/auth/presentation/manager/taggel/toggle_checkbox.dart';
import 'package:social_app/features/auth/presentation/manager/taggel/toggle_choose_gender.dart';
import 'package:social_app/features/auth/presentation/manager/taggel/toggle_password2_cubit.dart';
import 'package:social_app/features/auth/presentation/manager/taggel/toggle_password3_cubit.dart';
import 'package:social_app/features/auth/presentation/widgets/build_gender_container.dart';
import 'package:social_app/features/auth/presentation/widgets/build_text_form_feld.dart';

class LogupPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController dateAndMonthController = TextEditingController();
  final TextEditingController yearController = TextEditingController();

  LogupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) => _handleAuthState(context, state),
      builder: (context, state) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => ToggleChooseGender()),
            BlocProvider(create: (context) => CheckboxCubit()),
            BlocProvider(create: (context) => TogglePassword2Cubit()),
            BlocProvider(create: (context) => TogglePassword3Cubit()),
          ],
          child: Scaffold(
            body: SingleChildScrollView(
              child: BuildContent(
                  formKey: formKey,
                  firstNameController: firstNameController,
                  lastNameController: lastNameController,
                  emailController: emailController,
                  passwordController: passwordController,
                  confirmPasswordController: confirmPasswordController,
                  dateAndMonthController: dateAndMonthController,
                  yearController: yearController,
                  context: context),
            ),
          ),
        );
      },
    );
  }

  void _handleAuthState(BuildContext context, AuthState state) {
    if (state is AuthSuccess) {
      context.push(page: const BottomNavBarApp());
      _clearControllers();
    } else if (state is AuthError) {
      Fluttertoast.showToast(
        msg: 'An unexpected error occurred.',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    }
  }

  void _clearControllers() {
    firstNameController.clear();
    lastNameController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    dateAndMonthController.clear();
    yearController.clear();
  }
}

class BuildContent extends StatelessWidget {
  const BuildContent({
    super.key,
    required this.formKey,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.dateAndMonthController,
    required this.yearController,
    required this.context,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController dateAndMonthController;
  final TextEditingController yearController;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(gradient: AppColors.scaffoldgradient),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height / 15,
          horizontal: sizesApp(context, 30, 35, 40).toDouble(),
        ),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BuildTitle(),
                const SizedBox(height: 35),
                BuildNameFields(
                    firstNameController: firstNameController,
                    lastNameController: lastNameController),
                const SizedBox(height: 20),
                BuildEmailField(emailController: emailController),
                const SizedBox(height: 20),
                BuildPasswordFields(
                    passwordController: passwordController,
                    confirmPasswordController: confirmPasswordController),
                const SizedBox(height: 13),
                BuildDateOfBirthFields(
                    dateAndMonthController: dateAndMonthController,
                    yearController: yearController),
                const SizedBox(height: 10),
                const BuildGenderSelection(),
                const SizedBox(height: 22),
                const BuildAgreementCheckbox(),
                const SizedBox(height: 18),
                BuildSignupButton(
                    formKey: formKey,
                    emailController: emailController,
                    passwordController: passwordController,
                    firstNameController: firstNameController,
                    lastNameController: lastNameController,
                    context: context),
                const SizedBox(height: 30),
                BuildSigninOption(context: context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BuildEmailField extends StatelessWidget {
  const BuildEmailField({
    super.key,
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return BuildTextFormField(
      textInputType: TextInputType.emailAddress,
      hintText: 'Email',
      controller: emailController,
      validator: 'Please enter your email',
    );
  }
}

class BuildTitle extends StatelessWidget {
  const BuildTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text('Sign up', style: AppStyles.whiteBold13);
  }
}

class BuildPasswordFields extends StatelessWidget {
  const BuildPasswordFields({
    super.key,
    required this.passwordController,
    required this.confirmPasswordController,
  });

  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<TogglePassword2Cubit, bool>(
          builder: (context, isPasswordVisible) {
            return BuildTextFormField(
              hintText: 'Password',
              controller: passwordController,
              validator: 'Please enter your password',
              obscureText: !isPasswordVisible,
              suffixIcon: IconButton(
                onPressed: () =>
                    context.read<TogglePassword2Cubit>().togglepassword2(),
                icon: Icon(
                  isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  color: AppColors.white,
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 20),
        BlocBuilder<TogglePassword3Cubit, bool>(
          builder: (context, isConfirmPasswordVisible) {
            return BuildTextFormField(
              hintText: 'Confirm password',
              controller: confirmPasswordController,
              validator: 'Please enter your confirm password',
              obscureText: !isConfirmPasswordVisible,
              suffixIcon: IconButton(
                onPressed: () =>
                    context.read<TogglePassword3Cubit>().togglepassword3(),
                icon: Icon(
                  isConfirmPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: AppColors.white,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class BuildDateOfBirthFields extends StatelessWidget {
  const BuildDateOfBirthFields({
    super.key,
    required this.dateAndMonthController,
    required this.yearController,
  });

  final TextEditingController dateAndMonthController;
  final TextEditingController yearController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Birth of date', style: AppStyles.whitePoppinsMedium12),
        const SizedBox(height: 7),
        Row(
          children: [
            Expanded(
              child: BuildTextFormField(
                textInputType: TextInputType.number,
                controller: dateAndMonthController,
                hintText: 'Date/month',
                validator: 'Please enter your Date/month',
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: BuildTextFormField(
                textInputType: TextInputType.number,
                controller: yearController,
                hintText: 'Year',
                validator: 'Please enter your Year',
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class BuildGenderSelection extends StatelessWidget {
  const BuildGenderSelection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Gender', style: AppStyles.whitePoppinsMedium12),
        const SizedBox(height: 3),
        BlocBuilder<ToggleChooseGender, String>(
          builder: (context, gender) {
            return const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BuildGenderContainer(gender: 'Male'),
                BuildGenderContainer(gender: 'Female'),
                BuildGenderContainer(gender: 'Other'),
              ],
            );
          },
        ),
      ],
    );
  }
}

class BuildAgreementCheckbox extends StatelessWidget {
  const BuildAgreementCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocBuilder<CheckboxCubit, bool>(
          builder: (context, isChecked) {
            return Checkbox(
              value: isChecked,
              onChanged: (value) => context.read<CheckboxCubit>().checkBox(),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              side: const BorderSide(color: AppColors.white, width: 2),
              hoverColor: Colors.transparent,
            );
          },
        ),
        RichText(
          text: TextSpan(
            text: 'I agree with ',
            style: AppStyles.whitePoppinsMedium12,
            children: [
              TextSpan(
                  text: 'privacy',
                  style: AppStyles.whitePoppinsMedium12
                      .copyWith(color: AppColors.blue)),
              TextSpan(text: ' and ', style: AppStyles.whitePoppinsMedium12),
              TextSpan(
                  text: 'policy',
                  style: AppStyles.whitePoppinsMedium12
                      .copyWith(color: AppColors.blue)),
            ],
          ),
        ),
      ],
    );
  }
}

class BuildSignupButton extends StatelessWidget {
  const BuildSignupButton({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.firstNameController,
    required this.lastNameController,
    required this.context,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return BuildElevatedBottom(
      text: 'Sign up',
      width: 1.2,
      onPressed: () {
        if (formKey.currentState?.validate() ?? false) {
          context.read<AuthCubit>().signup(
                emailController.text,
                passwordController.text,
                firstNameController.text,
                lastNameController.text,
              );
        }
      },
    );
  }
}

class BuildSigninOption extends StatelessWidget {
  const BuildSigninOption({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Already have an account?', style: AppStyles.whitePoppinsMedium12),
        GestureDetector(
          onTap: () => context.pop(),
          child: Text('Sign in',
              style: AppStyles.whitePoppinsMedium12
                  .copyWith(color: AppColors.purple)),
        ),
      ],
    );
  }
}

class BuildNameFields extends StatelessWidget {
  const BuildNameFields({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
  });

  final TextEditingController firstNameController;
  final TextEditingController lastNameController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: BuildTextFormField(
            hintText: 'First name',
            controller: firstNameController,
            validator: 'Please enter your first name',
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: BuildTextFormField(
            hintText: 'Last name',
            controller: lastNameController,
            validator: 'Please enter your last name',
          ),
        ),
      ],
    );
  }
}
