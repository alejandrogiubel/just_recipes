import 'package:equatable/equatable.dart';
import 'package:just_recipes/src/data/models/measures.dart';

class ExtendedIngredients extends Equatable {
  const ExtendedIngredients({
    this.aisle,
    this.amount,
    this.consitency,
    this.id,
    this.image,
    this.measures,
    this.meta,
    this.name,
    this.original,
    this.originalName,
    this.unit,
  });

  ExtendedIngredients.fromJson(Map<String, dynamic> json)
      : aisle = json['aisle'] as String?,
        amount = json['amount'] as double?,
        consitency = json['consitency'] as String?,
        id = json['id'] as int?,
        image = json['image'] as String?,
        measures = (json['measures'] as Map<String, dynamic>?) != null
            ? Measures.fromJson(json['measures'] as Map<String, dynamic>)
            : null,
        meta = json['meta'] as List?,
        name = json['name'] as String?,
        original = json['original'] as String?,
        originalName = json['originalName'] as String?,
        unit = json['unit'] as String?;
  final String? aisle;
  final double? amount;
  final String? consitency;
  final int? id;
  final String? image;
  final Measures? measures;
  final List<dynamic>? meta;
  final String? name;
  final String? original;
  final String? originalName;
  final String? unit;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'aisle': aisle,
        'amount': amount,
        'consitency': consitency,
        'id': id,
        'image': image,
        'measures': measures?.toJson(),
        'meta': meta,
        'name': name,
        'original': original,
        'originalName': originalName,
        'unit': unit
      };

  @override
  List<Object?> get props => [
        aisle,
        amount,
        consitency,
        id,
        image,
        measures,
        meta,
        name,
        original,
        originalName,
        unit
      ];
}
