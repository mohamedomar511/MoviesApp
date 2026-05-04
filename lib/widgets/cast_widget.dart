import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/cubits/cast/cast_cubit.dart';
import 'package:movies_app/cubits/cast/cast_state.dart';
import 'package:movies_app/widgets/home_widgets/skeletonizer.dart';
import 'package:movies_app/widgets/home_widgets/texts_style.dart';

class CastWidget extends StatelessWidget {
  const CastWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CastCubit, CastState>(
      builder: (context, state) {
        if (state is CastLoading) {
          return const Center(child: CastSkeletonizer());
        }

        if (state is CastSuccess) {
          final cast = state.castModel.cast;

          return SizedBox(
            height: 140,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: cast.length,
              itemBuilder: (context, index) {
                final actor = cast[index];

                final actorImage = actor["profile_path"] != null
                    ? "https://image.tmdb.org/t/p/w500${actor["profile_path"]}"
                    : null;

                return Container(
                  width: 100,
                  margin: const EdgeInsets.only(right: 12),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 35,
                        backgroundColor: Colors.grey.shade800,
                        backgroundImage: actorImage != null
                            ? NetworkImage(actorImage)
                            : null,
                        child: actorImage == null
                            ? const Icon(Icons.person, color: Colors.white)
                            : null,
                      ),

                      const SizedBox(height: 8),

                      Text(
                        actor["name"] ?? "unknown",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: movieDetails2(),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}
