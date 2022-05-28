import 'package:flutter/material.dart';

class RecipeDetailsPage extends StatelessWidget {
  const RecipeDetailsPage({
    required this.recipeId,
    super.key,
  });
  final int recipeId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipeId.toString()),
      ),
      body: Center(
        child: Text('Recipe Details'),
      ),
    );
  }
}
