import 'package:just_recipes/src/data/models/metric.dart';
import 'package:just_recipes/src/data/models/us.dart';

class Measures {
  Measures({
    this.metric,
    this.us,
  });
  Measures.fromJson(Map<String, dynamic> json)
      : metric = (json['metric'] as Map<String, dynamic>?) != null
            ? Metric.fromJson(json['metric'] as Map<String, dynamic>)
            : null,
        us = (json['us'] as Map<String, dynamic>?) != null
            ? Us.fromJson(json['us'] as Map<String, dynamic>)
            : null;
  final Metric? metric;
  final Us? us;

  Map<String, dynamic> toJson() =>
      <String, dynamic>{'metric': metric?.toJson(), 'us': us?.toJson()};
}
