import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; 
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:social_app/Core/Constant/app_colors.dart';
import 'package:social_app/Core/Constant/sizes_app.dart';
import 'package:social_app/features/app/presentation/cubit/bottom_nav_bar_cubit.dart';

class BottomNavBarApp extends StatelessWidget {
  BottomNavBarApp({super.key});

  @override
  Widget build(BuildContext context) {
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
              child: _pages[currentIndex],
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: AppColors.purplebottom,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
              onPressed: () {},
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
                    context
                        .read<BottomNavBarCubit>()
                        .changeIndex(index); 
                  },
                  gapLocation: GapLocation.center,
                  notchSmoothness: NotchSmoothness.smoothEdge,
                  leftCornerRadius: 30,
                  rightCornerRadius: 30,
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

  final List<Widget> _pages = [
    const Center(child: Text("Home Page")),
    const Center(child: Text("Favorites Page")),
    const Center(child: Text("Profile Page")),
    const Center(child: Text("Settings Page")),
  ];
}
