// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CurrencyDataImpl _$$CurrencyDataImplFromJson(Map<String, dynamic> json) =>
    _$CurrencyDataImpl(
      base: json['base'] as String,
      rates: (json['rates'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
    );

Map<String, dynamic> _$$CurrencyDataImplToJson(_$CurrencyDataImpl instance) =>
    <String, dynamic>{'base': instance.base, 'rates': instance.rates};
