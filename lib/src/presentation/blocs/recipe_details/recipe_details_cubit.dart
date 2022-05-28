import 'package:bloc/bloc.dart';
import 'package:just_recipes/src/data/models/recipe.dart';
import 'package:meta/meta.dart';

part 'recipe_details_state.dart';

class RecipeDetailsCubit extends Cubit<RecipeDetailsState> {
  RecipeDetailsCubit() : super(RecipeDetailsInitialState());
}
