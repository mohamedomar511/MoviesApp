import 'package:movies_app/cubits/bottom_nav/bottom_nav_cubit.dart';
import 'package:movies_app/cubits/bottom_nav/bottom_nav_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../home_screen/home_screen.dart';
import 'search_screen.dart';
import 'fav_screen.dart';
import 'profile_screen.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = const [
      HomeScreen(),
      SearchScreen(),
      FavoritesScreen(),
      ProfileScreen(),
    ];

    return BlocBuilder<BottomNavCubit, BottomNavState>(
      builder: (context, state) {
        return Scaffold(
          body: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: screens[state.index],
          ),
          bottomNavigationBar: SizedBox(
            child: BottomNavigationBar(
              currentIndex: state.index,
              onTap: (index) =>
                  context.read<BottomNavCubit>().changeIndex(index),
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: 'Favorites',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
