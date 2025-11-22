import 'dart:ui';

import 'package:movies_app/widgets/home_widgets/texts_style.dart';
import 'package:flutter/material.dart';

class MovieDetailsScreen extends StatelessWidget {
  final String image;
  final String title;
  final String overview;
  final double voteAverage;
  final String mediaType;
  final double popularity;

  const MovieDetailsScreen({
    super.key,
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

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
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
              margin: EdgeInsets.only(top: height * 0.6),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(40)),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 35,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xff0A1B39).withValues(alpha: 0.2),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.2),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(title, style: movieDetails()),
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









//Stack(
      //   children: [
          // Positioned.fill(
          //   child: Image.network(
          //     image,
          //     fit: BoxFit.cover,
          //     errorBuilder: (context, error, stackTrace) => Container(
          //       color: Colors.grey.shade800,
          //       child: const Icon(
          //         Icons.broken_image,
          //         color: Colors.white54,
          //         size: 100,
          //       ),
          //     ),
          //   ),
          // ),
      //     Positioned.fill(
      //       child: Container(
      //         decoration: BoxDecoration(
      //           gradient: LinearGradient(
      //             begin: Alignment.topCenter,
      //             end: Alignment.bottomCenter,
      //             colors: [
      //               Colors.transparent,
      //               Colors.black.withOpacity(0.6),
      //               Colors.black.withOpacity(0.9),
      //             ],
      //           ),
      //         ),
      //       ),
      //     ),
      //     Align(
      //       alignment: Alignment.bottomCenter,
      //       child: Padding(
      //         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
      //         child: ClipRRect(
      //           borderRadius: BorderRadius.circular(20),
      //           child: BackdropFilter(
      //             filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
      //             child: Container(
      //               width: double.infinity,
      //               padding: const EdgeInsets.all(20),
      //               decoration: BoxDecoration(
      //                 color: Colors.white.withOpacity(0.1),
      //                 border: Border.all(color: Colors.white.withOpacity(0.2)),
      //                 borderRadius: BorderRadius.circular(20),
      //               ),
      //               child: Column(
      //                 mainAxisSize: MainAxisSize.min,
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: [
      //                   Text(
      //                     title,
      //                     style: const TextStyle(
      //                       color: Colors.white,
      //                       fontSize: 22,
      //                       fontWeight: FontWeight.bold,
      //                     ),
      //                   ),
      //                   const SizedBox(height: 8),
      //                   Row(
      //                     children: [
      //                       Text(
      //                         "⭐ $voteAverage",
      //                         style: const TextStyle(color: Colors.white70),
      //                       ),
      //                       const SizedBox(width: 12),
      //                       Text(
      //                         "🎬 $mediaType",
      //                         style: const TextStyle(color: Colors.white70),
      //                       ),
      //                       const SizedBox(width: 12),
      //                       Text(
      //                         "🔥 $popularity",
      //                         style: const TextStyle(color: Colors.white70),
      //                       ),
      //                     ],
      //                   ),
      //                   const SizedBox(height: 14),
      //                   Text(
      //                     overview.isNotEmpty
      //                         ? overview
      //                         : "No overview available",
      //                     style: const TextStyle(
      //                       color: Colors.white70,
      //                       fontSize: 14,
      //                       height: 1.4,
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),