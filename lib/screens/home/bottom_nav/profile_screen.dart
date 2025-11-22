import 'package:movies_app/screens/home/bottom_nav/fav_screen.dart';
import 'package:movies_app/screens/home/bottom_nav/widgets/profile_menu.dart';
import 'package:movies_app/screens/home/bottom_nav/widgets/switch_dark.dart';
import 'package:movies_app/screens/login_screen.dart';
import 'package:movies_app/widgets/logic/navigator.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(19.0),
        child: ListView(
          children: [
            Center(
              child: ClipOval(
                child: Image.asset(
                  'assets/images/me2.png',
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 14),
            const Text(
              textAlign: TextAlign.center,
              'Mohamed Omar',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 37),
            ProfileMenu(
              icon: Icons.person,
              text: 'Your Profile',
              onPressed: () {},
            ),
            const SizedBox(height: 20),
            SwitchDark(),
            // ProfileMenu(icon: Icons.switch_account, text: 'My Order'),
            const SizedBox(height: 20),
            ProfileMenu(
              icon: Icons.payment,
              text: 'Payment Methods',
              onPressed: () {},
            ),
            const SizedBox(height: 20),
            ProfileMenu(
              icon: Icons.favorite,
              text: 'Wishlist',
              onPressed: () {
                goTo(FavoritesScreen());
              },
            ),
            const SizedBox(height: 20),
            ProfileMenu(
              icon: Icons.settings,
              text: 'Settings',
              onPressed: () {},
            ),
            const SizedBox(height: 20),
            ProfileMenu(
              icon: Icons.logout,
              text: 'Log Out',
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                  (Route<dynamic> route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
