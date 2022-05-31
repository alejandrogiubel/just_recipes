import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:just_recipes/src/presentation/router/router.gr.dart';
import 'package:just_recipes/src/presentation/style/themes.dart';
import 'package:just_recipes/src/presentation/utils/extensions/widget_extension.dart';
import 'package:just_recipes/src/presentation/widgets/simple_outlined_button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = GetIt.I
        .get<Box<bool>>(instanceName: 'dark_mode_box')
        .get('darkMode', defaultValue: false)!;
    final currentTheme = isDarkMode ? darkTheme : lightTheme;
    return ThemeSwitchingArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  'assets/icons/chef.svg',
                  height: 200,
                  color: isDarkMode ? Colors.white : Colors.black,
                ).withDominoAnimation,
                const SizedBox(height: 20),
                Text(
                  'All the recipes on your fingertips',
                  textAlign: TextAlign.center,
                  style: currentTheme.textTheme.headline5?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ).withDominoDelayedRevealAnimation(
                  const Duration(milliseconds: 400),
                ),
                const SizedBox(height: 20),
                Text(
                  'Cook made easy',
                  style: currentTheme.textTheme.subtitle2,
                ).withDominoDelayedRevealAnimation(
                  const Duration(milliseconds: 600),
                ),
                const SizedBox(height: 100),
                SimpleOutlinedButton(
                  text: "Let's start",
                  onPressed: () {
                    context.router.replace(const RootRoute());
                  },
                ).withDominoDelayedRevealAnimation(
                  const Duration(milliseconds: 800),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
