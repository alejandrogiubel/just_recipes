import 'package:equatable/equatable.dart';

class Us extends Equatable {
  const Us({
    this.amount,
    this.unitLong,
    this.unitShort,
  });

  Us.fromJson(Map<String, dynamic> json)
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

  @override
  List<Object?> get props => [amount, unitLong, unitShort];
}
