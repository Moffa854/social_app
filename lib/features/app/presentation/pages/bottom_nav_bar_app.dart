import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:social_app/Core/Constant/app_colors.dart';
import 'package:social_app/Core/Constant/sizes_app.dart';
import 'package:social_app/Core/Extensions/Navigation/app_navigations.dart';
import 'package:social_app/features/app/presentation/cubit/bottom_nav_bar_cubit.dart';
import 'package:social_app/features/chat/presentation/pages/chat_main_page.dart';
import 'package:social_app/features/chat/presentation/pages/chat_page.dart';
import 'package:social_app/features/home/presentation/pages/add_post_page.dart';
import 'package:social_app/features/home/presentation/pages/home_page.dart';
import 'package:social_app/features/person/domain/usecases/get_user_data_usecase.dart';
import 'package:social_app/features/person/presentation/pages/person_page.dart';
import 'package:social_app/injections.dart';

class BottomNavBarApp extends StatelessWidget {
  const BottomNavBarApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const HomePage(),
      const ChatPage(),
      const PersonPage(),
      const Center(child: Text("Notfication Page")),
    ];
    return BlocProvider(
      create: (context) => BottomNavBarCubit(),
      child: BlocBuilder<BottomNavBarCubit, int>(
        builder: (context, currentIndex) {
          return Scaffold(
            body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration:
                  const BoxDecoration(gradient: AppColors.scaffoldgradient),
              child: pages[currentIndex],
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: AppColors.purplebottom,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
              onPressed: () async {
                final user =
                    await getIt.get<GetUserDataUsecase>().call().then((value) {
                  return value.fold((l) {
                    return null;
                  }, (r) {
                    return r;
                  });
                });
                if (context.mounted) {
                  context.push(page: AddPostPage(userModel: user!));
                }
              },
              child: const Icon(FontAwesomeIcons.plus,
                  color: AppColors.heavywhite, size: 35),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: Stack(
              children: [
                const Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: AppColors.heavywhite,
                    ),
                  ),
                ),
                AnimatedBottomNavigationBar(
                  borderColor: Colors.transparent,
                  elevation: 0,
                  borderWidth: 0,
                  iconSize: 20,
                  height: sizesApp(context, 40, 50, 60).toDouble(),
                  backgroundColor: const Color(0xffE7E7E7),
                  icons: const [
                    FontAwesomeIcons.houseChimney,
                    FontAwesomeIcons.solidComments,
                    FontAwesomeIcons.solidUser,
                    FontAwesomeIcons.solidBell,
                  ],
                  activeIndex: currentIndex,
                  onTap: (index) {
                    context.read<BottomNavBarCubit>().changeIndex(index);
                  },
                  gapLocation: GapLocation.center,
                  notchSmoothness: NotchSmoothness.smoothEdge,
                  leftCornerRadius: 40,
                  rightCornerRadius: 40,
                  activeColor: AppColors.purplebottom,
                  inactiveColor: AppColors.purplebottom,
                  splashColor: AppColors.purplebottom,
                  notchMargin: 15,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
