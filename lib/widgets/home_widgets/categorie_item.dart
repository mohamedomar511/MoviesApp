import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/cubits/movie/top_rated_tv_cubit.dart';
import 'package:movies_app/screens/home/home_screen/top_rated_movies.dart';
import 'package:movies_app/widgets/logic/navigator.dart';
import 'package:movies_app/widgets/logic/theme.dart';

class CategorieItem extends StatelessWidget {
  const CategorieItem({
    super.key,
    required this.image,
    required this.text,
    required this.mediaType,
    required this.query,
  });
  final String image;
  final String text;
  final String mediaType;
  final String query;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            context.read<TopTvCubit>().fetchTopRatedTv(
              mediaType: mediaType,
              query: query,
            );
            goTo(CategorieView(mediaType: mediaType, query: query));
          },

          child: Container(
            height: 70,
            width: 70,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppTheme.isDark
                  ? const Color(0xff13254F)
                  : Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(image, style: const TextStyle(fontSize: 40)),
            ),
          ),
        ),
        Text(
          text,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
