import 'package:flutter/material.dart';
import 'package:movies_app/screens/home/bottom_nav/profile_screen.dart';
import 'package:movies_app/widgets/home_widgets/texts_style.dart';
import 'package:movies_app/widgets/logic/navigator.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text('Hello, Mohamed', style: style()),
      centerTitle: false,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 14.0),
          child: InkWell(
            onTap: () => goTo(ProfileScreen()),
            child: ClipOval(
              child: Image.asset(
                'assets/images/me2.png',
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
