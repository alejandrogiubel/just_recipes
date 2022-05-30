import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:just_recipes/src/presentation/style/themes.dart';
import 'package:just_recipes/src/presentation/widgets/simple_network_image.dart';

class RecipeTile extends StatelessWidget {
  const RecipeTile({
    this.title = 'Recipe of the day',
    this.subtitle = 'Rosted beef with potatoes',
    this.timeInMinutes = 30,
    this.portions = 4,
    this.imageUrl = 'https://picsum.photos/400/300',
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
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (imageUrl != null)
                  Center(
                    child: SimpleNetworkImage(
                      imageUrl: imageUrl!,
                    ),
                  ),
                const SizedBox(height: 20),
                Text(
                  title,
                  style: textTheme.headline5?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  subtitle,
                  style: textTheme.headline6?.copyWith(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 40),
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
              ],
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
