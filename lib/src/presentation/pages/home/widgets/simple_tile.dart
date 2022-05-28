import 'package:flutter/material.dart';
import 'package:just_recipes/src/presentation/style/themes.dart';

class SimpleTile extends StatelessWidget {
  const SimpleTile({
    this.title = 'Title',
    this.subtitle,
    super.key,
  });
  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      width: 260,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.light
              ? cardLightColor
              : cardDarkColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
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
              if (subtitle != null)
                Text(
                  subtitle!,
                  style: textTheme.headline6,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
