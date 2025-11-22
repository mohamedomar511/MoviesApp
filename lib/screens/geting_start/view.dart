import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:movies_app/screens/geting_start/widgets/style.dart';
import 'package:movies_app/screens/login_screen.dart';
import 'package:movies_app/screens/signup.dart';
import 'package:movies_app/widgets/logic/navigator.dart';
import 'package:movies_app/widgets/login_sign_widgets/filledbutton.dart';
import 'package:movies_app/widgets/login_sign_widgets/signup_option.dart';

class GettingStartScreen extends StatelessWidget {
  const GettingStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              'assets/images/gettingstart.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: height * 0.52),
            width: double.infinity,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 35,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.02),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'CineTime 🎬',
                        textAlign: TextAlign.center,
                        style: titleStyle(),
                      ),
                      const SizedBox(height: 25),
                      Text(
                        'Get ready to dive into greatest',
                        textAlign: TextAlign.center,
                        style: descriptionStyle(),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'stories in Tv and Film',
                        textAlign: TextAlign.center,
                        style: descriptionStyle(),
                      ),
                      const SizedBox(height: 35),
                      Filledbutton(
                        filltext: 'Sign In',
                        fun: () {
                          goOff(LoginScreen());
                        },
                      ),
                      const SizedBox(height: 10),
                      SignOption(
                        color: Colors.white,
                        text1: 'Don’t have an account?',
                        text2: 'Sign Up',
                        page: Signup(),
                      ),
                      const SizedBox(height: 25),
                      Text(
                        'By creating an account or signing in, you agree to',
                        textAlign: TextAlign.center,
                        style: dontHaveAnAccountStyle(),
                      ),
                      Text.rich(
                        textAlign: TextAlign.center,
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'our ',
                              style: dontHaveAnAccountStyle(),
                            ),
                            const TextSpan(
                              text: 'Terms of service and privacy policy',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
