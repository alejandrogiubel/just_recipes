class Metric {
  Metric({
    this.amount,
    this.unitLong,
    this.unitShort,
  });

  Metric.fromJson(Map<String, dynamic> json)
      : amount = json['amount'] as double?,
        unitLong = json['unitLong'] as String?,
        unitShort = json['unitShort'] as String?;
  final double? amount;
  final String? unitLong;
  final String? unitShort;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'amount': amount,
        'unitLong': unitLong,
        'unitShort': unitShort
      };
}
