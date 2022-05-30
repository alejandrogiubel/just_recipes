import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:just_recipes/src/presentation/style/themes.dart';
import 'package:just_recipes/src/presentation/widgets/simple_network_image.dart';

class RecipeOfTheDay extends StatelessWidget {
  const RecipeOfTheDay({
    this.title = 'Recipe of the day',
    this.subtitle = 'Rosted beef with potatoes',
    this.timeInMinutes = 30,
    this.portions = 4,
    this.imageUrl = 'https://picsum.photos/300/200',
    this.onTap,
    super.key,
  });
  final String title;
  final String subtitle;
  final int timeInMinutes;
  final int portions;
  final String? imageUrl;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.light
            ? cardLightColor
            : cardDarkColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: 220,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title.split(' ')[0],
                    style: textTheme.headline5
                        ?.copyWith(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  Text(
                    title.split(' ').skip(1).join(' '),
                    style: textTheme.headline5?.copyWith(fontSize: 30),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    subtitle,
                    style: textTheme.headline6?.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    runSpacing: 15,
                    spacing: 15,
                    children: [
                      labeledIcon(
                        context,
                        FontAwesomeIcons.clock,
                        '$timeInMinutes min',
                      ),
                      labeledIcon(
                        context,
                        FontAwesomeIcons.plateWheat,
                        '$portions portions',
                      ),
                    ],
                  ),
                  if (imageUrl != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Center(
                        child: SimpleNetworkImage(
                          imageUrl: imageUrl!,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget labeledIcon(BuildContext context, IconData icon, String label) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        FaIcon(icon, size: 18),
        const SizedBox(width: 5),
        Text(
          label,
          style: Theme.of(context).textTheme.subtitle2,
        ),
      ],
    );
  }
}
