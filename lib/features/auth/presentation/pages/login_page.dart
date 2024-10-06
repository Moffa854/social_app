import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:social_app/Config/Router/routes_name.dart';
import 'package:social_app/Core/Constant/app_colors.dart';
import 'package:social_app/Core/Constant/app_styles.dart';
import 'package:social_app/Core/Constant/app_svg.dart';
import 'package:social_app/Core/Constant/sizes_app.dart';
import 'package:social_app/Core/Extensions/Navigation/app_navigations.dart';
import 'package:social_app/Core/Widgets/build_elevated_bottom.dart';
import 'package:social_app/features/auth/presentation/cubit/taggel/toggle_checkbox.dart';
import 'package:social_app/features/auth/presentation/cubit/taggel/toggle_cubit.dart';
import 'package:social_app/features/auth/presentation/widgets/build_text_form_feld.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckboxCubit(),
      child: BlocProvider(
        create: (context) => TogglePassword1Cubit(),
        child: Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              gradient: AppColors.scaffoldgradient,
            ),
            child: Padding(
              padding:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 11),
              child: Column(
                children: [
                  Text(
                    'Ciao',
                    style: TextStyle(
                      fontFamily: 'Waterfall Regular',
                      fontSize: 90.sp,
                      foreground: Paint()
                        ..shader = const LinearGradient(
                          colors: <Color>[
                            Color(0xff3B21B5),
                            Color(0xff8F62D7),
                            Color(0xffC69BE7)
                          ],
                        ).createShader(
                          const Rect.fromLTWH(250.0, 250.0, 250.0, 250.0),
                        ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: sizesApp(context, 30, 35, 40).toDouble()),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sign in',
                          style:
                              AppStyles.whiteBold13.copyWith(fontSize: 18.sp),
                        ),
                        const SizedBox(height: 30),
                        Column(
                          children: [
                            BuildTextFormField(
                              controller: emailController,
                              hintText: 'Email',
                              validator: 'Please enter your email',
                            ),
                            const SizedBox(height: 20),
                            BlocBuilder<TogglePassword1Cubit, bool>(
                              builder: (context, state) {
                                return BuildTextFormField(
                                  controller: passwordController,
                                  hintText: 'Password',
                                  validator: 'Please enter your password',
                                  obscureText: state ? true : false,
                                  suffixIcon: IconButton(
                                    onPressed: context
                                        .read<TogglePassword1Cubit>()
                                        .togglepassword,
                                    icon: Icon(
                                      state
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: AppColors.white,
                                    ),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    BlocBuilder<CheckboxCubit, bool>(
                                      builder: (context, state) {
                                        return Checkbox(
                                          hoverColor: Colors.transparent,
                                          side: const BorderSide(
                                              color: AppColors.white, width: 2),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            side: const BorderSide(
                                                color: AppColors.white,
                                                width: 2),
                                          ),
                                          value: state,
                                          onChanged: (value) {
                                            context
                                                .read<CheckboxCubit>()
                                                .checkBox();
                                          },
                                        );
                                      },
                                    ),
                                    Text(
                                      'Remember me',
                                      style: AppStyles.whitePoppinsMedium12,
                                    ),
                                  ],
                                ),
                                Text(
                                  'Forgot password',
                                  style:
                                      AppStyles.whitePoppinsMedium12.copyWith(
                                    color: AppColors.purple,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            BuildElevatedBottom(
                              onPressed: () {
                                context.pushNamed(pageRoute: RoutesName.home);
                              },
                              text: 'Sign in',
                              width: 1.2,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Or sign in with',
                            style: AppStyles.whitePoppinsMedium12,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: SvgPicture.asset(AppSvg.google),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Don’t have an account?',
                              style: AppStyles.whitePoppinsMedium12,
                            ),
                            GestureDetector(
                              onTap: () {
                                context.pushNamed(pageRoute: RoutesName.logup);
                              },
                              child: Text(
                                'Sign up',
                                style: AppStyles.whitePoppinsMedium12.copyWith(
                                  color: AppColors.purple,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
