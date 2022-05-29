import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:just_recipes/src/presentation/blocs/settings/settings_cubit.dart';
import 'package:just_recipes/src/presentation/style/themes.dart';

class SettingsPage extends StatelessWidget with AutoRouteWrapper {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, Settings>(
      builder: (context, state) {
        print('asd');
        var darkMode = state.darkMode;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Settings'),
          ),
          body: ListTile(
            title: const Text('Dark mode'),
            trailing: ThemeSwitcher(
              builder: (context) {
                return StatefulBuilder(
                  builder: (context, setState) {
                    return Switch(
                      onChanged: (bool value) {
                        print(value);
                        setState(() {
                          darkMode = value;
                        });
                        context
                            .read<SettingsCubit>()
                            .saveDarkMode(darkMode: value);
                        ThemeSwitcher.of(context).changeTheme(
                          theme: value ? darkTheme : lightTheme,
                        );
                      },
                      value: darkMode,
                    );
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I.get<SettingsCubit>()..loadSettings(),
      child: this,
    );
  }
}
