import 'package:freezed_annotation/freezed_annotation.dart';

part 'quote_model.freezed.dart';
part 'quote_model.g.dart';

@freezed
class Quote with _$Quote {
  const factory Quote({
    @JsonKey(name: 'q') required String content,
    @JsonKey(name: 'a') required String author,
  }) = _Quote;

  factory Quote.fromJson(Map<String, dynamic> json) => _$QuoteFromJson(json);
}
