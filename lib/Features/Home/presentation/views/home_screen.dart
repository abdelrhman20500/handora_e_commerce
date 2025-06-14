import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:handora_e_commerce/Features/Home/presentation/views/tabs/cart_tab/presentation/views/cart_tab.dart';
import 'package:handora_e_commerce/Features/Home/presentation/views/tabs/fav_tab/presentation/view/fav_tab.dart';
import 'package:handora_e_commerce/Features/Home/presentation/views/tabs/home_tab/presentation/view/home_tab.dart';
import 'package:handora_e_commerce/Features/Home/presentation/views/tabs/profile_tab/presentation/view/profile_tab.dart';
import '../../../../Core/utilis/app_color.dart';
import '../view_manger/nav_bar_cubit.dart';
import '../view_manger/nav_bar_state.dart';


class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});


  static const String routeName ="HomeScreen";
  final List<Widget> tabs=[
    const HomeTab(),
    const CartTab(),
    const FavTab(),
    const ProfileTab(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavBarCubit(),
      child: BlocBuilder<NavBarCubit, NavBarState>(
        builder: (context, state) {
          var cubit = BlocProvider.of<NavBarCubit>(context);
          return Scaffold(
            body: SafeArea(
                child: tabs[cubit.currentIndex]
            ),
            bottomNavigationBar: Container(
              decoration: const BoxDecoration(
                  color: AppColors.kWhiteColor
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
                child: GNav(
                    onTabChange: (index) {
                      cubit.changeIndex(index); // Update the index here
                    },
                    rippleColor: AppColors.kPrimaryColor, // tab button ripple color when pressed
                    hoverColor: AppColors.kPrimaryColor, // tab button hover color
                    haptic: true, // haptic feedback
                    tabBorderRadius: 15,
                    duration: const Duration(milliseconds: 180), // tab animation duration
                    gap: 8, // the tab button gap between icon and text
                    color: AppColors.kGreyColor, // unselected icon color
                    activeColor: AppColors.kWhiteColor, // selected icon and text color
                    iconSize: 28, // tab button icon size
                    tabBackgroundColor: AppColors.kPrimaryColor, // selected tab background color
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12), // navigation bar padding
                    tabs: const[
                      GButton(icon: Icons.home, text: 'Home',),
                      GButton(icon: Icons.favorite, text: 'Favorite',),
                      GButton(icon: Icons.shopping_cart, text: 'Cart',),
                      GButton(icon: Icons.person, text: 'Profile',),
                    ]
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}