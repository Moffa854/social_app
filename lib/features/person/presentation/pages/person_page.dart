import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:social_app/Core/Constant/app_colors.dart';
import 'package:social_app/Core/Constant/app_styles.dart';
import 'package:social_app/Core/Constant/sizes_app.dart';
import 'package:social_app/Core/Widgets/build_elevated_bottom.dart';
import 'package:social_app/features/person/presentation/cubit/person_cubit.dart';
import 'package:social_app/features/person/presentation/cubit/user_profile_cover_image/user_profile_cover_image_cubit.dart';

class PersonPage extends StatelessWidget {
  final String fristname;
  final String lastname;
  const PersonPage(
      {super.key, required this.fristname, required this.lastname});

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProfileCubit()..loadProfile(),
        ),
        BlocProvider(
          create: (context) => UserProfileCoverImageCubit()..loadCoverImage(),
        )
      ],
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(gradient: AppColors.scaffoldgradient),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  BlocBuilder<UserProfileCoverImageCubit, String?>(
                    builder: (context, coverImageUrl) {
                      return InkWell(
                        onTap: () {
                          context
                              .read<UserProfileCoverImageCubit>()
                              .chooseImageCover();
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.3,
                          decoration: const BoxDecoration(
                            color: Colors.black54,
                          ),
                          child: coverImageUrl == null
                              ? Center(
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'edit cover photo ',
                                          style: AppStyles.whitePoppinsMedium12
                                              .copyWith(
                                                  color:
                                                      AppColors.purplebottom),
                                        ),
                                        const WidgetSpan(
                                          child: FaIcon(
                                            FontAwesomeIcons.camera,
                                            color: AppColors.purplebottom,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : CachedNetworkImage(
                                  imageUrl: coverImageUrl,
                                  fit: BoxFit.cover,
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.3,
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                  placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator(
                                      color: AppColors.purplebottom,
                                    ),
                                  ),
                                ),
                        ),
                      );
                    },
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.25,
                    left: 0,
                    right: 0,
                    child: BlocBuilder<ProfileCubit, String?>(
                      builder: (context, profileImageUrl) {
                        return GestureDetector(
                          onTap: () {
                            context.read<ProfileCubit>().chooseImageProfile();
                          },
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
                            child: CircleAvatar(
                              radius: 45,
                              // backgroundColor: AppColors.purplebottom,
                              child: profileImageUrl == null
                                  ? const FaIcon(
                                      FontAwesomeIcons.camera,
                                      color: Colors.white,
                                    )
                                  : ClipOval(
                                      child: CachedNetworkImage(
                                        imageUrl: profileImageUrl,
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
                        );
                      },
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
                      //name user
                      text: '$fristname ',
                      style: AppStyles.heavybluePoppinsSemiBold13,
                    ),
                    TextSpan(
                      //name user
                      text: '$lastname ',
                      style: AppStyles.heavybluePoppinsSemiBold13,
                    ),
                    const WidgetSpan(
                      child: FaIcon(
                        FontAwesomeIcons.penToSquare,
                        color: AppColors.heavyblue,
                      ),
                    )
                  ],
                ),
              ),
              Text(
                user!.email!,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
