import 'package:movies_app/widgets/logic/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/cubits/theme/cubit.dart';
import 'package:movies_app/cubits/theme/state.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
  });
  final IconData icon;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        final isDark = AppTheme.isDark;
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.07,
          child: Card(
            elevation: 0.5,
            margin: EdgeInsets.zero,
            child: OutlinedButton(
              onPressed: onPressed,
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 19,
                  vertical: 18,
                ),
                side: BorderSide(
                  color: isDark
                      ? const Color(0xff12243F)
                      : const Color(0xffFFFFFF),
                ),
                backgroundColor: isDark
                    ? const Color(0xff13254F)
                    : Colors.white,
              ),
              child: Row(
                children: [
                  Icon(icon, color: const Color(0xff588BF0)),
                  const SizedBox(width: 18),
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: isDark ? Colors.white : const Color(0xff000000),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
