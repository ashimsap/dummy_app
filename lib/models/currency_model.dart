import 'package:freezed_annotation/freezed_annotation.dart';

part 'currency_model.freezed.dart';
part 'currency_model.g.dart';

@freezed
class CurrencyData with _$CurrencyData {
  const factory CurrencyData({
    required String base,
    required Map<String, double> rates,
  }) = _CurrencyData;

  factory CurrencyData.fromJson(Map<String, dynamic> json) => _$CurrencyDataFromJson(json);
}
