import 'package:movies_app/cubits/theme/cubit.dart';
import 'package:movies_app/cubits/theme/state.dart';
import 'package:movies_app/widgets/logic/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchDark extends StatelessWidget {
  const SwitchDark({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        final isDark = AppTheme.isDark;

        return Card(
          elevation: 0.5,
          margin: EdgeInsets.zero,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.07,
            child: OutlinedButton(
              onPressed: () {},
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
                    : const Color(0xffFFFFFF),
              ),
              child: Row(
                children: [
                  const Icon(Icons.dark_mode, color: Color(0xff588BF0)),
                  const SizedBox(width: 18),
                  Text(
                    'Dark Mode',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: isDark ? Colors.white : const Color(0xff000000),
                    ),
                  ),
                  const Spacer(),
                  Switch(
                    activeColor: const Color(0xff588BF0),
                    activeTrackColor: const Color(
                      0xff588BF0,
                    ).withValues(alpha: 0.2),
                    inactiveTrackColor: const Color(0xffFFFFFF),
                    value: AppTheme.isDark,
                    onChanged: (value) {
                      context.read<ThemeCubit>().changeAppMode();
                    },
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
