import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

class Settings {
  Settings({required this.darkMode, required this.themeScheme});

  final bool darkMode;
  final String themeScheme;
}

@injectable
class SettingsCubit extends Cubit<Settings> {
  SettingsCubit(
    @Named('dark_mode_box') this._darkModeBox,
    @Named('theme_scheme_box') this._themeSchemeBox,
  ) : super(Settings(darkMode: false, themeScheme: 'damask'));
  final Box<bool> _darkModeBox;
  final Box<String> _themeSchemeBox;

  void loadSettings() {
    final darkMode = _darkModeBox.get('darkMode', defaultValue: false);
    final themeScheme = _themeSchemeBox.get(
      'themeScheme',
      defaultValue: 'damask',
    );
    emit(Settings(darkMode: darkMode!, themeScheme: themeScheme!));
  }

  void saveDarkMode({required bool darkMode}) {
    _darkModeBox.put('darkMode', darkMode);
  }

  void saveThemeScheme({required String themeScheme}) {
    _themeSchemeBox.put('themeScheme', themeScheme);
  }
}
