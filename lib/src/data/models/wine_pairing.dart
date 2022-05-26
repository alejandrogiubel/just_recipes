import 'package:just_recipes/src/data/models/product_matches.dart';

class WinePairing {
  WinePairing({
    this.pairedWines,
    this.pairingText,
    this.productMatches,
  });
  WinePairing.fromJson(Map<String, dynamic> json)
      : pairedWines = (json['pairedWines'] as List?)
            ?.map((dynamic e) => e as String)
            .toList(),
        pairingText = json['pairingText'] as String?,
        productMatches = (json['productMatches'] as List?)
            ?.map((dynamic e) =>
                ProductMatches.fromJson(e as Map<String, dynamic>))
            .toList();
  final List<String>? pairedWines;
  final String? pairingText;
  final List<ProductMatches>? productMatches;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'pairedWines': pairedWines,
        'pairingText': pairingText,
        'productMatches': productMatches?.map((e) => e.toJson()).toList()
      };
}
