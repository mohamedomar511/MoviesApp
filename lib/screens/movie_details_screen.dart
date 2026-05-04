import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/cubits/cast/cast_cubit.dart';
import 'package:movies_app/widgets/cast_widget.dart';
import 'package:movies_app/widgets/home_widgets/texts_style.dart';

class MovieDetailsScreen extends StatelessWidget {
  final int movieId;
  final String image;
  final String title;
  final String overview;
  final double voteAverage;
  final String mediaType;
  final double popularity;

  const MovieDetailsScreen({
    super.key,
    required this.movieId,
    required this.image,
    required this.title,
    required this.overview,
    required this.voteAverage,
    required this.mediaType,
    required this.popularity,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    context.read<CastCubit>().getCast(movieId);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              image,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                color: Colors.grey.shade800,
                child: const Icon(
                  Icons.broken_image,
                  color: Colors.white54,
                  size: 100,
                ),
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(top: height * 0.45),
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 30,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xff0A1B39).withValues(alpha: 0.2),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.2),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            title,
                            style: movieDetails(),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "⭐ ${voteAverage.toStringAsFixed(1)}",
                                style: movieDetails2(),
                              ),
                              const SizedBox(width: 12),
                              Text("🎬 $mediaType", style: movieDetails2()),
                              const SizedBox(width: 12),
                              Text(
                                "🔥 ${popularity.toStringAsFixed(1)}",
                                style: movieDetails2(),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Text(
                            overview.isNotEmpty
                                ? overview
                                : "No overview available",
                            style: movieDetails2(),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 25),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Cast 🎭", style: movieDetails()),
                          ),
                          const SizedBox(height: 15),
                          const CastWidget(),
                        ],
                      ),
                    ),
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
