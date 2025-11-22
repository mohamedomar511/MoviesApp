import 'package:animate_do/animate_do.dart';
import 'package:movies_app/screens/onboarding.dart';
import 'package:movies_app/widgets/logic/navigator.dart';
import 'package:movies_app/widgets/logic/theme.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.isDark
          ? const Color(0xff041435)
          : const Color(0xffFFFFFF),
      body: Center(
        child: FadeInRightBig(
          onFinish: (direction) => goTo(const Onboarding()),
          duration: const Duration(seconds: 3),
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AppTheme.isDark
                    ? const AssetImage('assets/images/dark_logo.png')
                    : const AssetImage('assets/images/light_logo.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
