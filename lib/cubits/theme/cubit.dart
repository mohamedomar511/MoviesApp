import 'package:movies_app/cubits/theme/state.dart';
import 'package:movies_app/widgets/logic/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());

  //static ThemeCubit instance() => BlocProvider.of(navigatorKey.currentContext!);
  void changeAppMode() {
    AppTheme.isDark = !AppTheme.isDark;
    emit(ChangeThemeState());
  }
}
