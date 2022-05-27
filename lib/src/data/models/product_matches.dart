import 'package:equatable/equatable.dart';

class ProductMatches extends Equatable {
  const ProductMatches({
    this.id,
    this.title,
    this.description,
    this.price,
    this.imageUrl,
    this.averageRating,
    this.ratingCount,
    this.score,
    this.link,
  });
  ProductMatches.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        title = json['title'] as String?,
        description = json['description'] as String?,
        price = json['price'] as String?,
        imageUrl = json['imageUrl'] as String?,
        averageRating = json['averageRating'] as double?,
        ratingCount = json['ratingCount'] as double?,
        score = json['score'] as double?,
        link = json['link'] as String?;
  final int? id;
  final String? title;
  final String? description;
  final String? price;
  final String? imageUrl;
  final double? averageRating;
  final double? ratingCount;
  final double? score;
  final String? link;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'title': title,
        'description': description,
        'price': price,
        'imageUrl': imageUrl,
        'averageRating': averageRating,
        'ratingCount': ratingCount,
        'score': score,
        'link': link
      };

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        price,
        imageUrl,
        averageRating,
        ratingCount,
        score,
        link
      ];
}
