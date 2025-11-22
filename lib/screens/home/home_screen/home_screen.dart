import 'package:movies_app/widgets/home_widgets/app_bar.dart';
import 'package:movies_app/widgets/home_widgets/carsoul.dart';
import 'package:movies_app/widgets/home_widgets/categries.dart';
import 'package:movies_app/widgets/home_widgets/trend_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),

      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Carousel(),
            const SizedBox(height: 20),
            const Categories(),
            const TrendScreen(),
          ],
        ),
      ),
    );
  }
}
