import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:social_app/Core/Constant/app_colors.dart';
import 'package:social_app/Core/Constant/app_styles.dart';
import 'package:social_app/Core/Constant/sizes_app.dart';
import 'package:social_app/features/home/presentation/cubit/get%20posts/get_posts_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetPostsCubit, GetPostsState>(
      builder: (context, state) {
        if (state is GetPostsloading) {
          const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
        if (state is GetPostsfailuare) {
          Center(
            child: Text(state.errorMessage.toString()),
          );
        }
        if (state is GetPostssuccess) {
          final data = state;

          return RefreshIndicator(
            color: AppColors.purple,
            onRefresh: () async {
              await context.read<GetPostsCubit>().getPosts();
            },
            child: Scaffold(
              body: Container(
                height: MediaQuery.sizeOf(context).height,
                width: MediaQuery.sizeOf(context).width,
                decoration: const BoxDecoration(
                  gradient: AppColors.scaffoldgradient,
                ),
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: sizesApp(context, 20, 30, 40).toDouble(),
                        ),
                        child: SafeArea(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left:
                                      sizesApp(context, 34, 44, 54).toDouble(),
                                  right:
                                      sizesApp(context, 19, 29, 39).toDouble(),
                                ),
                                child: Row(
                                  children: [
                                    const Flexible(
                                      child: BuildTextFeildSearch(
                                        text: 'Search',
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        size: 30,
                                        color: AppColors.white,
                                        Icons.notifications_rounded,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height:
                                    sizesApp(context, 31, 41, 51).toDouble(),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left:
                                      sizesApp(context, 10, 20, 30).toDouble(),
                                ),
                                child: SizedBox(
                                  height: sizesApp(context, 100, 120, 140)
                                      .toDouble(),
                                  width: MediaQuery.sizeOf(context).width,
                                  child: ListView.builder(
                                    itemCount: data.posts.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (
                                      context,
                                      index,
                                    ) {
                                      return Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                              right:
                                                  sizesApp(context, 10, 15, 20)
                                                      .toDouble(),
                                            ),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: AppColors.wardy,
                                                width: 2,
                                              ),
                                            ),
                                            child: CircleAvatar(
                                              radius:
                                                  sizesApp(context, 35, 40, 45)
                                                      .toDouble(),
                                              backgroundColor:
                                                  AppColors.purplebottom,
                                              backgroundImage: NetworkImage(
                                                data.posts[index].userImage,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            data.posts[index].fristName,
                                            style:
                                                AppStyles.whitePoppinsMedium12,
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                height:
                                    sizesApp(context, 20, 30, 40).toDouble(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SliverList.builder(
                      itemCount: data.posts.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(
                            left: sizesApp(context, 34, 44, 54).toDouble(),
                            right: sizesApp(context, 19, 29, 39).toDouble(),
                            bottom: sizesApp(context, 20, 30, 40).toDouble(),
                          ),
                          padding: const EdgeInsets.all(10),
                          width: MediaQuery.sizeOf(context).width,
                          decoration: BoxDecoration(
                            color: AppColors.purple2.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: AppColors.wardy,
                                        width: 2,
                                      ),
                                    ),
                                    child: CircleAvatar(
                                      radius: sizesApp(context, 28, 38, 48)
                                          .toDouble(),
                                      backgroundImage: NetworkImage(
                                        data.posts[index].userImage,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: sizesApp(context, 10, 15, 20)
                                        .toDouble(),
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        data.posts[index].fristName,
                                        style: AppStyles.whitePoppinsMedium12,
                                      ),
                                      Text(
                                        DateFormat('dd/MM/yyyy').format(
                                          data.posts[index].postDate,
                                        ),
                                        style: AppStyles.whitePoppinsMedium12
                                            .copyWith(
                                          fontSize: 12,
                                        ),
                                      )
                                    ],
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.more_vert,
                                      color: AppColors.white,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height:
                                    sizesApp(context, 10, 15, 20).toDouble(),
                              ),
                              Text(
                                data.posts[index].description,
                                style: AppStyles.whitePoppinsMedium12.copyWith(
                                  fontSize: 13,
                                ),
                              ),
                              SizedBox(
                                height:
                                    sizesApp(context, 10, 15, 20).toDouble(),
                              ),
                              Container(
                                width: MediaQuery.sizeOf(context).width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Image.network(
                                    data.posts[index].postImage!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  BuildTextIconButton(
                                    onpressed: () {},
                                    icon: const FaIcon(
                                        FontAwesomeIcons.solidHeart,
                                        color: AppColors.white),
                                    text: '0',
                                  ),
                                  BuildTextIconButton(
                                    onpressed: () {},
                                    text: '0',
                                    icon: const FaIcon(
                                      FontAwesomeIcons.solidCommentDots,
                                      color: AppColors.white,
                                    ),
                                  ),
                                  const Spacer(),
                                  BuildTextIconButton(
                                    onpressed: () {},
                                    //send
                                    icon: const FaIcon(
                                      FontAwesomeIcons.solidPaperPlane,
                                      color: AppColors.white,
                                    ),
                                    text: '0',
                                  )
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
      },
    );
  }
}

class BuildTextFeildSearch extends StatelessWidget {
  final String text;
  const BuildTextFeildSearch({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10),
        filled: true,
        fillColor: AppColors.purplebottom,
        prefixIcon: const Icon(
          Icons.search,
          color: AppColors.white,
        ),
        hintText: text,
        hintStyle: AppStyles.whitePoppinsMedium12,
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
      ),
    );
  }
}

class BuildTextIconButton extends StatelessWidget {
  final String text;
  final FaIcon icon;
  final VoidCallback onpressed;
  const BuildTextIconButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onpressed,
      icon: ShaderMask(
          shaderCallback: (Rect bounds) {
            return const LinearGradient(
              colors: [AppColors.purpleIcon, AppColors.pinkicon],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(bounds);
          },
          child: icon),
      label: Text(text, style: AppStyles.whitePoppinsMedium12),
    );
  }
}
