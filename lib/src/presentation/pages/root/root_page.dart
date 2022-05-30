import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:auto_route/auto_route.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:just_recipes/src/presentation/router/router.gr.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: AutoTabsScaffold(
        routes: const [
          HomeRoute(),
          MyRecipesRoute(),
          CookNowRoute(),
          SettingsRoute(),
        ],
        bottomNavigationBuilder: (_, tabsRouter) {
          return FloatingNavbar(
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            padding: const EdgeInsets.all(5),
            backgroundColor: Theme.of(context).primaryColor.withOpacity(0.2),
            selectedItemColor: Colors.white,
            selectedBackgroundColor:
                Theme.of(context).primaryColor.withOpacity(0.5),
            unselectedItemColor: Theme.of(context).primaryColor,
            items: [
              FloatingNavbarItem(
                icon: const FaIcon(FontAwesomeIcons.lightbulb).icon,
                title: 'Inspiration',
              ),
              FloatingNavbarItem(
                icon: const FaIcon(FontAwesomeIcons.listCheck).icon,
                title: 'My recipes',
              ),
              FloatingNavbarItem(
                icon: const FaIcon(FontAwesomeIcons.kitchenSet).icon,
                title: 'Cook now',
              ),
              FloatingNavbarItem(
                icon: const FaIcon(FontAwesomeIcons.gear).icon,
                title: 'Settings',
              ),
            ],
          );
        },
      ),
    );
  }
}
