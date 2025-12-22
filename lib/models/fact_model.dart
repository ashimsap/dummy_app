import 'package:freezed_annotation/freezed_annotation.dart';

part 'fact_model.freezed.dart';
part 'fact_model.g.dart';

@freezed
class Fact with _$Fact {
  const factory Fact({
    required String text,
  }) = _Fact;

  factory Fact.fromJson(Map<String, dynamic> json) => _$FactFromJson(json);
}
