import 'package:movies_app/screens/geting_start/view.dart';
import 'package:movies_app/widgets/onboarding_widget/back_widget.dart';
import 'package:movies_app/widgets/onboarding_widget/circleavatar_widget.dart';
import 'package:movies_app/widgets/onboarding_widget/page_decoration.dart';
import 'package:movies_app/widgets/onboarding_widget/title_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IntroductionScreen(
          pages: [
            PageViewModel(
              titleWidget: Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('Welcome To\nCineTime World', style: getStyle()),
                ),
              ),
              body: '',
              image: Image.asset(
                'assets/images/page1.jpg',
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),
              decoration: getdecoration(),
            ),
            PageViewModel(
              titleWidget: Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Watch Movies🍿\n & Series🖥️',
                    style: getStyle(),
                  ),
                ),
              ),
              body: '',
              image: Image.asset(
                'assets/images/page2.jpg',
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),
              decoration: getdecoration(),
            ),
            PageViewModel(
              titleWidget: Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text('Hi,Discover Now', style: getStyle()),
                ),
              ),
              body: '',
              image: Image.asset(
                'assets/images/page3.jpg',
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),
              decoration: getdecoration(),
            ),
          ],

          done: const CircleavatarWidget(),
          onDone: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const GettingStartScreen(),
              ),
            );
          },
          showNextButton: true,
          next: const CircleavatarWidget(),
          nextFlex: 0,
          skipOrBackFlex: 0,
          showBackButton: true,
          back: const BackWidget(),
          dotsDecorator: getDots(),
        ),
      ],
    );
  }
}
