class FoundRecipes {
  FoundRecipes({
    this.offset,
    this.number,
    this.results,
    this.totalResults,
  });

  FoundRecipes.fromJson(Map<String, dynamic> json)
      : offset = json['offset'] as int?,
        number = json['number'] as int?,
        results = (json['results'] as List?)
            ?.map((dynamic e) => Results.fromJson(e as Map<String, dynamic>))
            .toList(),
        totalResults = json['totalResults'] as int?;
  final int? offset;
  final int? number;
  final List<Results>? results;
  final int? totalResults;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'offset': offset,
        'number': number,
        'results': results?.map((e) => e.toJson()).toList(),
        'totalResults': totalResults
      };
}

class Results {
  Results({
    this.id,
    this.title,
    this.calories,
    this.carbs,
    this.fat,
    this.image,
    this.imageType,
    this.protein,
  });

  Results.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        title = json['title'] as String?,
        calories = json['calories'] as int?,
        carbs = json['carbs'] as String?,
        fat = json['fat'] as String?,
        image = json['image'] as String?,
        imageType = json['imageType'] as String?,
        protein = json['protein'] as String?;
  final int? id;
  final String? title;
  final int? calories;
  final String? carbs;
  final String? fat;
  final String? image;
  final String? imageType;
  final String? protein;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'title': title,
        'calories': calories,
        'carbs': carbs,
        'fat': fat,
        'image': image,
        'imageType': imageType,
        'protein': protein
      };
}
