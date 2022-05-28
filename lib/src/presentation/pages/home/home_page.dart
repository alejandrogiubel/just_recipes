import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:just_recipes/src/presentation/pages/home/widgets/recipe_of_the_day.dart';
import 'package:just_recipes/src/presentation/pages/home/widgets/simple_tile.dart';
import 'package:just_recipes/src/presentation/pages/root/widgets/recipe_tile.dart';
import 'package:just_recipes/src/presentation/widgets/simple_outlined_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            splashRadius: 20,
            onPressed: () {},
            icon: const FaIcon(FontAwesomeIcons.magnifyingGlass, size: 20),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            getHeader(),
            const SizedBox(height: 40),
            getRecommended(context)
          ],
        ),
      ),
    );
  }

  Widget getHeader() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const RecipeOfTheDay(),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: SimpleTile(
                      title: 'Cook like pro',
                      subtitle: 'Thermomix  advanced tips and tricks',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: SimpleTile(
                      title: 'Check new updates',
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getRecommended(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'René Redzepi',
            style: Theme.of(context).textTheme.headline5?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
          ),
          Text(
            'recommends you',
            style: Theme.of(context).textTheme.headline5?.copyWith(
                  fontSize: 30,
                ),
          ),
          const SizedBox(height: 20),
          const RecipeTile(),
          const SizedBox(height: 10),
          const SimpleOutlinedButton()
        ],
      ),
    );
  }
}
