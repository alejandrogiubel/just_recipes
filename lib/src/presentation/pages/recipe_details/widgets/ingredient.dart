import 'package:flutter/material.dart';
import 'package:just_recipes/src/data/models/extended_ingredients.dart';

class Ingredient extends StatelessWidget {
  const Ingredient({
    required this.ingredient,
    super.key,
  });
  final ExtendedIngredients ingredient;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Flexible(
            child: Text(
              '• ${ingredient.original}',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
        ],
      ),
    );
  }
}
