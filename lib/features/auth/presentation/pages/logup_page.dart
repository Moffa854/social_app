import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Core/Constant/app_colors.dart';
import 'package:social_app/Core/Constant/app_styles.dart';
import 'package:social_app/Core/Constant/sizes_app.dart';
import 'package:social_app/Core/Extensions/Navigation/app_navigations.dart';
import 'package:social_app/Core/Widgets/build_elevated_bottom.dart';
import 'package:social_app/features/auth/presentation/cubit/taggel/toggle_checkbox.dart';
import 'package:social_app/features/auth/presentation/cubit/taggel/toggle_password2_cubit.dart';
import 'package:social_app/features/auth/presentation/cubit/taggel/toggle_password3_cubit.dart';
import 'package:social_app/features/auth/presentation/widgets/build_gender_container.dart';
import 'package:social_app/features/auth/presentation/widgets/build_text_form_feld.dart';

class LogupPage extends StatelessWidget {
  final TextEditingController fristnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController emailContrller = TextEditingController();
  final TextEditingController passwordContrller = TextEditingController();
  final TextEditingController confirmpasswordController =
      TextEditingController();
  LogupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckboxCubit(),
      child: BlocProvider(
        create: (context) => TogglePassword3Cubit(),
        child: BlocProvider(
          create: (context) => TogglePassword2Cubit(),
          child: Scaffold(
            body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                gradient: AppColors.scaffoldgradient,
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 15,
                  right: sizesApp(context, 30, 35, 40).toDouble(),
                  left: sizesApp(context, 30, 35, 40).toDouble(),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sign up',
                      style: AppStyles.whiteBold13,
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: BuildTextFormField(
                              hintText: 'First name',
                              controller: fristnameController,
                              validator: 'Please enter your first name'),
                        ),
                        SizedBox(
                            width: sizesApp(context, 25, 30, 35).toDouble()),
                        Flexible(
                          child: BuildTextFormField(
                              hintText: 'Last name',
                              controller: lastnameController,
                              validator: 'Please enter your last name'),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    BuildTextFormField(
                        hintText: 'Email',
                        controller: emailContrller,
                        validator: 'Please enter your email'),
                    const SizedBox(
                      height: 20,
                    ),
                    BlocBuilder<TogglePassword2Cubit, bool>(
                      builder: (context, state) {
                        return BuildTextFormField(
                          hintText: 'Password',
                          controller: passwordContrller,
                          validator: 'Please enter your password',
                          obscureText: state ? true : false,
                          suffixIcon: IconButton(
                            onPressed: () {
                              context
                                  .read<TogglePassword2Cubit>()
                                  .togglepassword2();
                            },
                            icon: Icon(
                              state ? Icons.visibility_off : Icons.visibility,
                              color: AppColors.white,
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    BlocBuilder<TogglePassword3Cubit, bool>(
                      builder: (context, state) {
                        return BuildTextFormField(
                          hintText: 'Confirm password',
                          controller: confirmpasswordController,
                          validator: 'Please enter your confirm password',
                          obscureText: state ? true : false,
                          suffixIcon: IconButton(
                            onPressed: () {
                              context
                                  .read<TogglePassword3Cubit>()
                                  .togglepassword3();
                            },
                            icon: Icon(
                              state ? Icons.visibility_off : Icons.visibility,
                              color: AppColors.white,
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    Text(
                      'Birth of date',
                      style: AppStyles.whitePoppinsMedium12,
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Row(
                      children: [
                        const Flexible(
                          child: BuildTextFormField(
                              hintText: 'Date/month',
                              validator: 'Please enter your Date/month'),
                        ),
                        SizedBox(
                            width: sizesApp(context, 25, 30, 35).toDouble()),
                        const Flexible(
                          child: BuildTextFormField(
                              hintText: 'Year',
                              validator: 'Please enter your Year'),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Gender',
                      style: AppStyles.whitePoppinsMedium12,
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BuildGenderContainer(
                          gender: 'Male',
                        ),
                        BuildGenderContainer(
                          gender: 'Female',
                        ),
                        BuildGenderContainer(
                          gender: 'Other',
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    Row(
                      children: [
                        BlocBuilder<CheckboxCubit, bool>(
                          builder: (context, state) {
                            return Checkbox(
                              hoverColor: Colors.transparent,
                              side: const BorderSide(
                                  color: AppColors.white, width: 2),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                                side: const BorderSide(
                                    color: AppColors.white, width: 2),
                              ),
                              value: state,
                              onChanged: (value) {
                                context.read<CheckboxCubit>().checkBox();
                              },
                            );
                          },
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'I agree with',
                            style: AppStyles.whitePoppinsMedium12,
                            children: [
                              TextSpan(
                                  text: ' privacy',
                                  style: AppStyles.whitePoppinsMedium12
                                      .copyWith(color: AppColors.blue)),
                              TextSpan(
                                  text: ' and',
                                  style: AppStyles.whitePoppinsMedium12),
                              TextSpan(
                                text: ' policy',
                                style: AppStyles.whitePoppinsMedium12
                                    .copyWith(color: AppColors.blue),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    BuildElevatedBottom(
                        text: 'Sign up', width: 1.2, onPressed: () {}),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Already have an account ?',
                          style: AppStyles.whitePoppinsMedium12,
                        ),
                        GestureDetector(
                          onTap: () {
                            context.pop();
                          },
                          child: Text(
                            'Sign in',
                            style: AppStyles.whitePoppinsMedium12.copyWith(
                              color: AppColors.purple,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
