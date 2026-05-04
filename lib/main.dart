import 'package:movies_app/cubits/bottom_nav/bottom_nav_cubit.dart';
import 'package:movies_app/cubits/cast/cast_cubit.dart';
import 'package:movies_app/cubits/fav/fav_cubit.dart';
import 'package:movies_app/cubits/movie/top_rated_tv_cubit.dart';
import 'package:movies_app/cubits/search/search_cubit.dart';
import 'package:movies_app/cubits/movie/movie_cubit.dart';
import 'package:movies_app/cubits/theme/cubit.dart';
import 'package:movies_app/cubits/theme/state.dart';
import 'package:movies_app/screens/splash_screen.dart';
import 'package:movies_app/widgets/logic/navigator.dart';
import 'package:movies_app/widgets/logic/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'cubits/auth/auth_cubit.dart';
import 'cubits/auth/bloc_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://abjeefpirrgzxlgedqnw.supabase.co',
    anonKey: 'sb_publishable_NtyxSop9f_EZpfmJd_Esow_0wZbhHvl',
  );

  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => BottomNavCubit()),
        BlocProvider(create: (context) => MovieCubit()),
        BlocProvider(create: (context) => SearchCubit()),
        BlocProvider(create: (context) => FavoriteCubit()),
        BlocProvider(create: (context) => TopTvCubit()),
        BlocProvider(create: (context) => ThemeCubit()),
        BlocProvider(create: (context) => CastCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            navigatorKey: navigatorKey,
            debugShowCheckedModeBanner: false,
            title: 'Movies App',
            themeMode: AppTheme.isDark ? ThemeMode.dark : ThemeMode.light,
            darkTheme: AppTheme.dark,
            theme: AppTheme.light,
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
