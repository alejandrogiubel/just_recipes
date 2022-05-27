import 'package:equatable/equatable.dart';

class SimilarRecipe extends Equatable {
  const SimilarRecipe({
    this.id,
    this.title,
    this.imageType,
    this.readyInMinutes,
    this.servings,
    this.sourceUrl,
  });

  SimilarRecipe.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        title = json['title'] as String?,
        imageType = json['imageType'] as String?,
        readyInMinutes = json['readyInMinutes'] as int?,
        servings = json['servings'] as int?,
        sourceUrl = json['sourceUrl'] as String?;
  final int? id;
  final String? title;
  final String? imageType;
  final int? readyInMinutes;
  final int? servings;
  final String? sourceUrl;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'title': title,
        'imageType': imageType,
        'readyInMinutes': readyInMinutes,
        'servings': servings,
        'sourceUrl': sourceUrl
      };

  @override
  List<Object?> get props =>
      [id, title, imageType, readyInMinutes, servings, sourceUrl];
}
