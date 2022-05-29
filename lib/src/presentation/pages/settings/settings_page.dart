import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:just_recipes/src/presentation/style/themes.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var darkMode = false;
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
                    setState(() {
                      darkMode = value;
                    });
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
  }
}
