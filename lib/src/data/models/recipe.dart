import 'package:just_recipes/src/data/models/extended_ingredients.dart';
import 'package:just_recipes/src/data/models/wine_pairing.dart';

class Recipe {
  Recipe({
    this.id,
    this.title,
    this.image,
    this.imageType,
    this.servings,
    this.readyInMinutes,
    this.license,
    this.sourceName,
    this.sourceUrl,
    this.spoonacularSourceUrl,
    this.aggregateLikes,
    this.healthScore,
    this.spoonacularScore,
    this.pricePerServing,
    this.analyzedInstructions,
    this.cheap,
    this.creditsText,
    this.cuisines,
    this.dairyFree,
    this.diets,
    this.gaps,
    this.glutenFree,
    this.instructions,
    this.ketogenic,
    this.lowFodmap,
    this.occasions,
    this.sustainable,
    this.vegan,
    this.vegetarian,
    this.veryHealthy,
    this.veryPopular,
    this.whole30,
    this.weightWatcherSmartPoints,
    this.dishTypes,
    this.extendedIngredients,
    this.summary,
    this.winePairing,
  });

  Recipe.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        title = json['title'] as String?,
        image = json['image'] as String?,
        imageType = json['imageType'] as String?,
        servings = json['servings'] as int?,
        readyInMinutes = json['readyInMinutes'] as int?,
        license = json['license'] as String?,
        sourceName = json['sourceName'] as String?,
        sourceUrl = json['sourceUrl'] as String?,
        spoonacularSourceUrl = json['spoonacularSourceUrl'] as String?,
        aggregateLikes = json['aggregateLikes'] as int?,
        healthScore = json['healthScore'] as int?,
        spoonacularScore = json['spoonacularScore'] as int?,
        pricePerServing = json['pricePerServing'] as double?,
        analyzedInstructions = json['analyzedInstructions'] as List?,
        cheap = json['cheap'] as bool?,
        creditsText = json['creditsText'] as String?,
        cuisines = json['cuisines'] as List?,
        dairyFree = json['dairyFree'] as bool?,
        diets = json['diets'] as List?,
        gaps = json['gaps'] as String?,
        glutenFree = json['glutenFree'] as bool?,
        instructions = json['instructions'] as String?,
        ketogenic = json['ketogenic'] as bool?,
        lowFodmap = json['lowFodmap'] as bool?,
        occasions = json['occasions'] as List?,
        sustainable = json['sustainable'] as bool?,
        vegan = json['vegan'] as bool?,
        vegetarian = json['vegetarian'] as bool?,
        veryHealthy = json['veryHealthy'] as bool?,
        veryPopular = json['veryPopular'] as bool?,
        whole30 = json['whole30'] as bool?,
        weightWatcherSmartPoints = json['weightWatcherSmartPoints'] as int?,
        dishTypes = (json['dishTypes'] as List?)
            ?.map((dynamic e) => e as String)
            .toList(),
        extendedIngredients = (json['extendedIngredients'] as List?)
            ?.map(
              (dynamic e) =>
                  ExtendedIngredients.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        summary = json['summary'] as String?,
        winePairing = (json['winePairing'] as Map<String, dynamic>?) != null
            ? WinePairing.fromJson(json['winePairing'] as Map<String, dynamic>)
            : null;

  final int? id;
  final String? title;
  final String? image;
  final String? imageType;
  final int? servings;
  final int? readyInMinutes;
  final String? license;
  final String? sourceName;
  final String? sourceUrl;
  final String? spoonacularSourceUrl;
  final int? aggregateLikes;
  final int? healthScore;
  final int? spoonacularScore;
  final double? pricePerServing;
  final List<dynamic>? analyzedInstructions;
  final bool? cheap;
  final String? creditsText;
  final List<dynamic>? cuisines;
  final bool? dairyFree;
  final List<dynamic>? diets;
  final String? gaps;
  final bool? glutenFree;
  final String? instructions;
  final bool? ketogenic;
  final bool? lowFodmap;
  final List<dynamic>? occasions;
  final bool? sustainable;
  final bool? vegan;
  final bool? vegetarian;
  final bool? veryHealthy;
  final bool? veryPopular;
  final bool? whole30;
  final int? weightWatcherSmartPoints;
  final List<String>? dishTypes;
  final List<ExtendedIngredients>? extendedIngredients;
  final String? summary;
  final WinePairing? winePairing;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'title': title,
        'image': image,
        'imageType': imageType,
        'servings': servings,
        'readyInMinutes': readyInMinutes,
        'license': license,
        'sourceName': sourceName,
        'sourceUrl': sourceUrl,
        'spoonacularSourceUrl': spoonacularSourceUrl,
        'aggregateLikes': aggregateLikes,
        'healthScore': healthScore,
        'spoonacularScore': spoonacularScore,
        'pricePerServing': pricePerServing,
        'analyzedInstructions': analyzedInstructions,
        'cheap': cheap,
        'creditsText': creditsText,
        'cuisines': cuisines,
        'dairyFree': dairyFree,
        'diets': diets,
        'gaps': gaps,
        'glutenFree': glutenFree,
        'instructions': instructions,
        'ketogenic': ketogenic,
        'lowFodmap': lowFodmap,
        'occasions': occasions,
        'sustainable': sustainable,
        'vegan': vegan,
        'vegetarian': vegetarian,
        'veryHealthy': veryHealthy,
        'veryPopular': veryPopular,
        'whole30': whole30,
        'weightWatcherSmartPoints': weightWatcherSmartPoints,
        'dishTypes': dishTypes,
        'extendedIngredients':
            extendedIngredients?.map((e) => e.toJson()).toList(),
        'summary': summary,
        'winePairing': winePairing?.toJson()
      };
}

class RandomRecipes {
  RandomRecipes({
    this.recipes,
  });

  RandomRecipes.fromJson(Map<String, dynamic> json)
      : recipes = (json['recipes'] as List?)
            ?.map((dynamic e) => Recipe.fromJson(e as Map<String, dynamic>))
            .toList();

  final List<Recipe>? recipes;

  Map<String, dynamic> toJson() =>
      <String, dynamic>{'recipes': recipes?.map((e) => e.toJson()).toList()};
}
