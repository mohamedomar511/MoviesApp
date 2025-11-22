// import 'package:car_shop/cubits/movie/movie_cubit.dart';
// import 'package:car_shop/cubits/movie/movie_state.dart';
// import 'package:car_shop/screens/home/movie_details_screen.dart';
// import 'package:car_shop/widgets/home_widgets/movie_item.dart';
// import 'package:car_shop/widgets/home_widgets/skeletonizer.dart';
// import 'package:car_shop/widgets/logic/navigator.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class MovieSection extends StatelessWidget {
//   final String title;
//   final Future<void> Function() fetchFunction;

//   const MovieSection({
//     super.key,
//     required this.title,
//     required this.fetchFunction,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final cubit = context.read<MovieCubit>();
//     final height = MediaQuery.of(context).size.height;

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           title,
//           style: const TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//         ),
//         const SizedBox(height: 10),
//         BlocBuilder<MovieCubit, MovieState>(
//           builder: (context, state) {
//             if (state is MovieInitial) {
//               fetchFunction();
//             }

//             if (state is MovieLoading) {
//               return SizedBox(
//                 height: height * 0.3,
//                 child: ListView.separated(
//                   itemBuilder: (context, index) => const SkeletonizerWidget(),
//                   separatorBuilder: (context, index) =>
//                       const SizedBox(width: 8),
//                   itemCount: 6,
//                   scrollDirection: Axis.horizontal,
//                 ),
//               );
//             }

//             if (state is MovieFailure) {
//               return Center(child: Text(state.errorMessage));
//             }

//             if (state is MovieSuccess) {
//               final movies = state.movieData.movies;
//               return SizedBox(
//                 height: height * 0.3,
//                 child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: movies.length,
//                   itemBuilder: (context, index) {
//                     final movie = movies[index];
//                     final title = movie['title'] ?? movie['name'] ?? 'No title';
//                     final poster = movie['poster_path'];
//                     final overview = movie['overview'] ?? 'No overview';
//                     final vote = (movie['vote_average'] ?? 0).toDouble();
//                     final popularity = (movie['popularity'] ?? 0).toDouble();

//                     if (poster == null) return const SizedBox();

//                     return MovieItem(
//                       image: "https://image.tmdb.org/t/p/w500$poster",
//                       text: title,
//                       movie: movie,
//                       onTap: () {
//                         goTo(
//                           context,
//                           MovieDetailsScreen(
//                             image: "https://image.tmdb.org/t/p/w500$poster",
//                             title: title,
//                             overview: overview,
//                             voteAverage: vote,
//                             mediaType: 'movie',
//                             popularity: popularity,
//                           ),
//                         );
//                       },
//                     );
//                   },
//                 ),
//               );
//             }

//             return const SizedBox();
//           },
//         ),
//       ],
//     );
//   }
// }
