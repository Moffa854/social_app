import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:social_app/Core/Constant/app_colors.dart';
import 'package:social_app/Core/Constant/app_styles.dart';
import 'package:social_app/Core/Constant/sizes_app.dart';
import 'package:social_app/Core/Extensions/Navigation/app_navigations.dart';
import 'package:social_app/Core/Widgets/build_elevated_bottom.dart';
import 'package:social_app/features/auth/presentation/manager/auth%20cubit/auth_cubit.dart';
import 'package:social_app/features/auth/presentation/pages/login_page.dart';
import 'package:social_app/features/home/presentation/pages/home_page.dart';
import 'package:social_app/features/person/presentation/cubit/person%20cubit/setting_cubit.dart';
import 'package:social_app/features/person/presentation/cubit/person%20cubit/setting_state.dart';
import 'package:social_app/features/person/presentation/pages/edit_person_page.dart';

class PersonPage extends StatelessWidget {
  const PersonPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonCubit, PersonState>(
      builder: (context, state) {
        if (state is SettingSuccess) {
          final user = state.userModel;
          return Scaffold(
            body: RefreshIndicator(
              backgroundColor: AppColors.purple,
              color: AppColors.heavyblue,
              notificationPredicate: (notification) => true,
              onRefresh: () => context.read<PersonCubit>().getUserData(),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration:
                      const BoxDecoration(gradient: AppColors.scaffoldgradient),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.3,
                            decoration: const BoxDecoration(
                              color: Colors.black54,
                            ),
                            //cover image
                            child: CachedNetworkImage(
                              imageUrl: user.coverPic ??
                                  'https://images.pexels.com/photos/2034373/pexels-photo-2034373.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                      decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              )),
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.3,
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                              placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.purplebottom,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: MediaQuery.of(context).size.height * 0.25,
                            left: 0,
                            right: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    spreadRadius: 2,
                                    blurRadius: 6,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              //profile image
                              child: CircleAvatar(
                                radius: 45,
                                child: ClipOval(
                                  child: CachedNetworkImage(
                                    imageBuilder: (context, imageProvider) =>
                                        CircleAvatar(
                                      radius: 45,
                                      backgroundImage: imageProvider,
                                    ),
                                    imageUrl: user.profilePic ??
                                        'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png',
                                    width: 88,
                                    height: 88,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) =>
                                        const CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.07,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '${user.fristname} ',
                              style: AppStyles.heavybluePoppinsSemiBold13,
                            ),
                            TextSpan(
                              //name user
                              text: '${user.lastname} ',
                              style: AppStyles.heavybluePoppinsSemiBold13,
                            ),
                            WidgetSpan(
                              child: GestureDetector(
                                onTap: () {
                                  context.push(
                                      page: EditPersonPage(user: user));
                                },
                                child: const FaIcon(
                                  FontAwesomeIcons.penToSquare,
                                  color: AppColors.heavyblue,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Text(
                        user.email,
                        style: AppStyles.whitePoppinsMedium12.copyWith(
                          color: AppColors.heavyblue,
                        ),
                      ),
                      SizedBox(
                        height: sizesApp(context, 15, 20, 25).toDouble(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text(
                                '10',
                                style: AppStyles.whitePoppinsSemiBold20,
                              ),
                              Text(
                                'Posts',
                                style: AppStyles.whitePoppinsRegular12,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                            child: VerticalDivider(
                              color: AppColors.white,
                              thickness: 1,
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                '10',
                                style: AppStyles.whitePoppinsSemiBold20,
                              ),
                              Text(
                                'Followers',
                                style: AppStyles.whitePoppinsRegular12,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                            child: VerticalDivider(
                              color: AppColors.white,
                              thickness: 1,
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                '140',
                                style: AppStyles.whitePoppinsSemiBold20,
                              ),
                              Text(
                                'Following',
                                style: AppStyles.whitePoppinsRegular12,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: sizesApp(context, 15, 20, 25).toDouble(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          BuildElevatedBottom(
                            hightPhone: 50,
                            text: 'Follow',
                            width: 2.5,
                            onPressed: () {},
                          ),
                          BuildElevatedBottom(
                            text: 'Message',
                            hightPhone: 50,
                            style: AppStyles.whiteBold13.copyWith(
                              color: AppColors.purplebottom,
                            ),
                            width: 2.5,
                            onPressed: () {},
                            backgroundColor: AppColors.white,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: sizesApp(context, 15, 20, 25).toDouble(),
                      ),
                      //log out
                      //
                      BuildTextIconButton(
                        text: 'Log Out',
                        icon: const FaIcon(
                          FontAwesomeIcons.rightFromBracket,
                          color: AppColors.white,
                        ),
                        onpressed: () {
                          context.read<AuthCubit>().logout().then((value) {
                          if (context.mounted) {
                              context.pushReplacement(page: LoginPage());
                          }
                          });
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        } else {
          if (state is SettingFailure) {
            return Center(
              child: Text(state.errorMessage),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.heavyblue,
              ),
            );
          }
        }
      },
    );
  }
}
